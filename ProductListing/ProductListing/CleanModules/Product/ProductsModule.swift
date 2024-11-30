//
//  ProductModule.swift
//  ProductListing
//
//  Created by Asad Mehmood on 28/11/2024.
//

import Foundation

class ProductsModule {
    
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func generateProductListView() -> ProductListView<ProductListViewModel> {
        ProductListView(viewModel: generateProductListViewModel())
    }
    
    private func generateProductListViewModel() -> ProductListViewModel {
        ProductListViewModel(useCase: generateProductListUseCase())
    }
    
    private func generateProductListUseCase() -> ProductListUseCase {
        DefaultProductListUseCase(repository: generateProductListRespository())
    }
    
    private func generateProductListRespository() -> ProductListRepository {
        DefaultProductListRepository(service: generateProductListService())
    }
    
    private func generateProductListService() -> ProductListService {
        DefaultProductListService(apiDataTransferService: apiDataTransferService)
    }
}
