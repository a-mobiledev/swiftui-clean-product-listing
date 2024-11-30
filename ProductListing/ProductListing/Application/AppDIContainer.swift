//
//  AppDIContainer.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//

import Foundation

class AppDIContainer {
    
    lazy private var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: AppConfiguration.baseURL)
        let session = DefaultNetworkSessionManager(session: SharedURLSession.shared)
        let networkManager = DefaultNetworkManager(config: config, sessionManager: session)
        return DefaultDataTransferService(networkManager: networkManager)
    }()
    
    lazy var productListView: ProductListView = {
        let productModule = ProductsModule(apiDataTransferService: apiDataTransferService)
        return productModule.generateProductListView()
    }()
}
