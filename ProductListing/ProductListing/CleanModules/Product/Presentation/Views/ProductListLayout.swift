//
//  ProductListLayout.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//

import SwiftUI

struct ProductListLayout: View {
    
    let items: [ProductListItemViewModel]
    let columns = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.id) { item in
                    NavigationLink(value: item) {
                        ProductListItemView(item: item)
                    }
                }
            }
            .padding(20)
        }
        .navigationDestination(for: ProductListItemViewModel.self) { item in
            ProductDetailView(item: item)
        }
    }
}

