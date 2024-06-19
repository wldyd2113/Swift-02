//
//  ContentView.swift
//  SignUpForm
//
//  Created by 차지용 on 6/18/24.
//

import SwiftUI
import Combine

class SignUpFormViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    @Published var usernameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var isValid: Bool = false
    
    @Published var isUserNameAvailble: Bool = false
    
    private var authenticationService = AuthenticationService()
    private var cancellables: Set<AnyCancellable> = []
    
    private lazy var isUsernameLengthValidPublisher: AnyPublisher<Bool, Never> = {
        $username.map{ $0.count >= 3 }.eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordMatchingPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest($password, $passwordConfirmation)
            .map(==)
//            .map {$0 == $1 }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isFormValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isUsernameLengthValidPublisher, isPasswordMatchingPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }()
    
    func checkUserNameAvailable(_ userName: String) {
        authenticationService.checkUserNameAvailableWithClosure(userName: userName) {
            [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let isAvailable):
                    self?.isUserNameAvailble = isAvailable
                case .failure(let error):
                    print("error \(error)")
                    self?.isUserNameAvailble = false
                }
            }
        }
    }
    
    
    
    init() {
        $username
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] userName in
                self?.checkUserNameAvailable(userName)
            }
            .store(in: &cancellables)
        
        isFormValidPublisher.assign(to: &$isValid)
        isUsernameLengthValidPublisher.map { $0 ? "" : "Username must be at least three characters!"}.assign(to: &$usernameMessage)
        
        Publishers.CombineLatest(isPasswordMatchingPublisher, isPasswordMatchingPublisher)
            .map { isPasswordEmpty, isPasswordMatching in
                if isPasswordEmpty {
                    return "Password must not be empty"
                } else if !isPasswordMatching {
                    return "Passwords do not match"

                }
                return ""
            }
            .assign(to: &$passwordMessage)
            
    }
    
}

struct ContentView: View {
    @StateObject var viewModel = SignUpFormViewModel()
    var body: some View {
        Form {
            Section(content:  {
                TextField("Username", text: $viewModel.username)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()//자동완성
            },footer: {
                Text(viewModel.usernameMessage)
                    .foregroundStyle(Color.red)
            })
            // Password
            Section {
                SecureField("Password",
                            text: $viewModel.password)
                SecureField("Repeat password",
                            text: $viewModel.passwordConfirmation)
            } footer: {
                Text(viewModel.passwordMessage)
                    .foregroundColor(.red)
            }
            // Submit button
            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
