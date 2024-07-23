//
//  PostViewModel.swift
//  Socially
//
//  Created by 차지용 on 7/23/24.
//

import SwiftUI
import FirebaseFirestore

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private var databaseReference = Firestore.firestore().collection("Posts")
}
