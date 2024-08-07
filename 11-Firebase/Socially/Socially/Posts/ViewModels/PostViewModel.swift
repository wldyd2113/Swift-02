//
//  PostViewModel.swift
//  Socially
//
//  Created by 차지용 on 7/23/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

class PostViewModel: ObservableObject {
    private var databaseReference = Firestore.firestore().collection("Posts")

    func addData(description: String, datePublished: Date, data: Data, completion: @escaping (Error?) -> Void) {
        let storageReference = Storage.storage().reference().child("\(UUID().uuidString)")

        storageReference.putData(data, metadata: nil) { metadata, error in
            if let error = error {
                completion(error)
                return
            }

            storageReference.downloadURL { url, error in
                if let error = error {
                    completion(error)
                    return
                }

                guard let downloadURL = url else {
                    completion(NSError(domain: "URLError", code: 0, userInfo: nil))
                    return
                }

                self.databaseReference.addDocument(data: [
                    "description": description,
                    "datePublished": datePublished,
                    "imageURL": downloadURL.absoluteString
                ]) { error in
                    completion(error)
                }
            }
        }
    }
}
