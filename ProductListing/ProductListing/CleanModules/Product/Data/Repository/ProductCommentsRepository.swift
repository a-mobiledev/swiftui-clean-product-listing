//
//  ProductCommentsRepository.swift
//  ProductListing
//
//  Created by Asad Mehmood on 04/12/2024.
//

import Foundation

class DefaultProductCommentsRepository: ProductCommentsRepository {
    
    let service: ProductCommentsService
    
    init(service: ProductCommentsService) {
        self.service = service
    }
    
    func fetchProductComments() async throws -> [ProductDomainCommentsDTO] {
        try await service.fetchProductCommentsFromNetwork().comments.map{$0.toDomain()}
    }
}
