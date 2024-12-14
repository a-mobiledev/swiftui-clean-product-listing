//
//  ProductDataCommentsDTO.swift
//  ProductListing
//
//  Created by Asad Mehmood on 14/12/2024.
//

import Foundation

struct ProductPageDataCommentsDTO: Decodable {
    let comments: [ProductDataCommentsDTO]
}

struct ProductDataCommentsDTO: Decodable {
    let commentId: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: ProductDomainCommentUserDTO
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id"
        case body
        case postId
        case likes
        case user
    }
}

extension ProductDataCommentsDTO {
    
    func toDomain() -> ProductDomainCommentsDTO {
        .init(commentId: self.commentId, body: body, postId: postId, likes: likes, user: user)
    }
}
