//
//  ProductListingApp.swift
//  ProductListing
//
//  Created by Asad Mehmood on 27/11/2024.
//

import SwiftUI

@main
struct ProductListingApp: App {

    private let appDIContainer = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            appDIContainer.productListView
        }
    }
}
