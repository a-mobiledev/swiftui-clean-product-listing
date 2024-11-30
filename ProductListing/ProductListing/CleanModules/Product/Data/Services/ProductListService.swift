//
//  ProductListService.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//

import Foundation

protocol ProductListService {
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO
}

class DefaultProductListService: ProductListService {
    
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndpoint.products, method: .get)
        
        return try await apiDataTransferService.request(request: productListNetworkRequest)
    }
}
