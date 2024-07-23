//
//  FeedView.swift
//  Socially
//
//  Created by 차지용 on 7/23/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct FeedView: View {
    @FirestoreQuery(collectionPath: "Posts") var posts: [Post]
    var body: some View {
        NavigationStack {
            List(posts) { post in
                VStack(alignment: .leading) {
                    VStack {
                        Text(post.description ?? "")
                            .font(.headline)
                            .padding(12)
                        Text("Published on the \(post.datePublished?.formatted() ?? "")")
                            .font(.caption)
                    }
                }
                .frame(minHeight: 100, maxHeight: 350)
            }
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(PostViewModel())
}
