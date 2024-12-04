//
//  ProductDataCommentUserDTO.swift
//  ProductListing
//
//  Created by Asad Mehmood on 02/12/2024.
//

import Foundation

struct ProductDataCommentUserDTO: Decodable {
    let userId: Int
    let username: String
    let fullname: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case username
        case fullname
    }
}
