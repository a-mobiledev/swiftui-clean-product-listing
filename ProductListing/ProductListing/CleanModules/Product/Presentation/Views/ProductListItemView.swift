//
//  ProductItemView.swift
//  ProductListing
//
//  Created by Asad Mehmood on 29/11/2024.
//

import SwiftUI

struct ProductListItemView: View {
    var index: Int
    
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "trash")
                .frame(width: 100, height: 100)
                .scaledToFit()
            Spacer()
            
            Text("Name \(index)")
                .font(.headline)
                .foregroundStyle(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(.blue)
        .presentationCornerRadius(10)
        .contextMenu {
            Button {
                print("Cell \(index) deleted")
            } label: {
                Label("Delete", systemImage: "trash")
            }

        }
    }
}
