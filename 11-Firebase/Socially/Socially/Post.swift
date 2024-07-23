//
//  Post.swift
//  Socially
//
//  Created by 차지용 on 7/23/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    @ServerTimestamp var datePublished: Date?
}
