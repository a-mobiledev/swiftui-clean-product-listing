//
//  ProductDomainCommentsDTO.swift
//  ProductListing
//
//  Created by Asad Mehmood on 02/12/2024.
//

import Foundation

struct ProductDomainCommentsDTO {
    let commentId: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: ProductDomainCommentUserDTO
}
