//
//  ProductCommentsService.swift
//  ProductListing
//
//  Created by Asad Mehmood on 04/12/2024.
//

import Foundation

protocol ProductCommentsService {
    func fetchProductCommentsFromNetwork() async throws -> ProductPageDataCommentsDTO
}

class DefaultProductCommentsService: ProductCommentsService {
    
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func fetchProductCommentsFromNetwork() async throws -> ProductPageDataCommentsDTO {
        
        let productCommentsNetworkRequest = DefaultNetworkRequest(path: APIEndpoint.comments, method: .get)
        return try await apiDataTransferService.request(request: productCommentsNetworkRequest)
    }
    
    
}
