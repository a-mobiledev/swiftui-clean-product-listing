//
//  ProductListViewModel.swift
//  ProductListing
//
//  Created by Asad Mehmood on 29/11/2024.
//

import Foundation

protocol ProductListViewModelProtocol: ObservableObject {
    
    var products: [ProductListItemViewModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    var title: String {get}
    
    func shouldShowLoader() -> Bool
    func fetchProducts() async
}

class ProductListViewModel: ProductListViewModelProtocol {
    
    @Published var products: [ProductListItemViewModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    var title: String = AppConstant.productListTitle
    private let productListUseCase: ProductListUseCase!

    init(useCase: ProductListUseCase) {
        self.productListUseCase = useCase
    }
    
    private func transformFetchedProducts(products: [ProductDomainListDTO]) -> [ProductListItemViewModel] {
        products.map { ProductListItemViewModel(id: $0.productId, title: $0.title, description: $0.description, category: $0.category, price: $0.price.getAmountWithCurrency(), image: $0.thumbnail)
        }
    }
    
    @MainActor
    func fetchProducts() async {
        do {
            let productList = try await productListUseCase.fetchProductList()
            self.products = transformFetchedProducts(products: productList)
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
    func shouldShowLoader() -> Bool {
        self.products.isEmpty && !isError
    }
}
