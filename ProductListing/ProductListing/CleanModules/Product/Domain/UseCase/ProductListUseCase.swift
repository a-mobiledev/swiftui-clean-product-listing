//
//  ProductListUseCase.swift
//  ProductListing
//
//  Created by Asad Mehmood on 28/11/2024.
//

import Foundation

protocol ProductListUseCase {
    func fetchProductList() async throws -> [ProductDomainListDTO]
}

class DefaultProductListUseCase: ProductListUseCase {
    
    private let repository: ProductListRepository
    
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
    func fetchProductList() async throws -> [ProductDomainListDTO] {
        try await repository.fetchProductList()
    }
}
