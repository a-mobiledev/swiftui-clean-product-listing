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
    
    func generateProductListView() -> ProductListView {
        ProductListView(productListViewModel: generateProductListViewModel())
    }
    
    func generateProductDetailView(item: ProductListItemViewModel) -> ProductDetailView {
        ProductDetailView(item: item)
    }
    
    private func generateProductListViewModel() -> ProductListViewModel {
        ProductListViewModel(useCase: generateProductListUseCase())
    }
    private func generateProductCommentsViewModel() -> ProductCommentsViewModel {
        ProductCommentsViewModel(useCase: generateProductCommentsUseCase())
    }
    
    private func generateProductListUseCase() -> ProductListUseCase {
        DefaultProductListUseCase(repository: generateProductListRespository())
    }
    private func generateProductCommentsUseCase() -> ProductCommentsUseCase {
        DefaultProductCommentsUseCase(repository: generateProductCommentsRespository())
    }
    
    private func generateProductListRespository() -> ProductListRepository {
        DefaultProductListRepository(service: generateProductListService())
    }
    private func generateProductCommentsRespository() -> ProductCommentsRepository {
        DefaultProductCommentsRepository(service: generateProductCommentsService())
    }
    
    private func generateProductListService() -> ProductListService {
        DefaultProductListService(apiDataTransferService: apiDataTransferService)
    }
    private func generateProductCommentsService() -> ProductCommentsService {
        DefaultProductCommentsService(apiDataTransferService: apiDataTransferService)
    }
}
