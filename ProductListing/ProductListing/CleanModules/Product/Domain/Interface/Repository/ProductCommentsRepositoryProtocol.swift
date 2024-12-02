//
//  ProductCommentsRepository.swift
//  ProductListing
//
//  Created by Asad Mehmood on 02/12/2024.
//

import Foundation

protocol ProductCommentsRepository {
    func fetchProductComments() async throws -> [ProductDomainCommentsDTO]
}
