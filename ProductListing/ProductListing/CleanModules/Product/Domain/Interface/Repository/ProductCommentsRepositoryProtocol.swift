//
//  ProductCommentsRepositoryProtocol.swift
//  ProductListing
//
//  Created by Asad Mehmood on 14/12/2024.
//

import Foundation

protocol ProductCommentsRepository {
    func fetchProductComments() async throws -> [ProductDomainCommentsDTO]
}
