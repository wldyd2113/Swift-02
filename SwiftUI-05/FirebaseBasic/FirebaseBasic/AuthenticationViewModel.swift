//
//  AuthenticationViewModel.swift
//  FirebaseBasic
//
//  Created by 차지용 on 4/29/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

//사용자의 인증상태를 관리하고 로그인 및 로그아웃을 처리함
extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first?
            .rootViewController
    }
}

@Observable
final class AuthenticationViewModel {
    enum State {
        case busy
        case signedIn
        case signedOut
    }
    
    var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? ""}
    var email: String { authResult?.user.email ?? ""}
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.disconnect()
        try? Auth.auth().signOut()
        state = .signedOut
    }
    func restorePreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn() { user, error in
            if let error { print("Error: \(error.localizedDescription)")}
            Task {
                await self.signIn(user: user)
            }
        }
    }
    
    func login() {
        state = .busy
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let rootViewController = UIApplication.currentRootViewController else {
            return
        }
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint:nil) {
            result, error in
            if let error { print("Error: \(error.localizedDescription)")}
            Task { await self.signIn(user:result?.user)}
        }
    }
    
    private func signIn(user: GIDGoogleUser?) async {
        guard let user, let idToken = user.idToken else {
            state = .signedOut
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString)
        
        do {
            authResult = try await Auth.auth().signIn(with: credential)
            state = .signedIn
        } catch {
            state = .signedOut
            print("Error: \(error.localizedDescription)")
        }
    }

}
