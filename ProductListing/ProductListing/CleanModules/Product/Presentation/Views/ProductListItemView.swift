//
//  ProductItemView.swift
//  ProductListing
//
//  Created by Asad Mehmood on 29/11/2024.
//

import SwiftUI

struct ProductListItemView: View {
    
    var item: ProductListItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: item.image, height: 150)
            Text(item.title).font(.title)
            Text(item.price)
                .foregroundStyle(.red)
                .font(.title2)
        }
        .preferredColorScheme(.light)
        
    }
}
