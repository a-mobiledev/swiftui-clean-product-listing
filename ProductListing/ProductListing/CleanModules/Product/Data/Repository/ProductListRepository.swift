//
//  ProductListRepository.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//

import Foundation


class DefaultProductListRepository: ProductListRepository {
    
    private let service: ProductListService
    
    init(service: ProductListService) {
        self.service = service
    }
    
    func fetchProductList() async throws -> [ProductDomainListDTO] {
        try await service.fetchProductListFromNetwork().products.map { $0.toDomain() }
    }
    
    
}
