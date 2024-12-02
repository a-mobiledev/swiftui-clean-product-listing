//
//  ProductComentsUseCase.swift
//  ProductListing
//
//  Created by Asad Mehmood on 02/12/2024.
//

import Foundation

protocol ProductCommentsUseCase {
    func fetchProductComments() async throws -> [ProductDomainCommentsDTO]
}

class DefaultProductCommentsUseCase: ProductCommentsUseCase {
    
    private let repository: ProductCommentsRepository
    
    init(repository: ProductCommentsRepository) {
        self.repository = repository
    }
    
    func fetchProductComments() async throws -> [ProductDomainCommentsDTO] {
        try await repository.fetchProductComments()
    }
}
