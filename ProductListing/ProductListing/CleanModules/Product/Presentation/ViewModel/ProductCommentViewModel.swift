//
//  ProductCommentViewModel.swift
//  ProductListing
//
//  Created by Asad Mehmood on 04/12/2024.
//

import Foundation

struct ProductCommentViewModel: Hashable {
    let id: Int
    let body: String
    let likes: Int
    let userName: String
    let fullName: String
}
