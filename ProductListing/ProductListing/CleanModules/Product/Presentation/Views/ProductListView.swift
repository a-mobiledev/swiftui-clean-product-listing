//
//  ContentView.swift
//  ProductListing
//
//  Created by Asad Mehmood on 27/11/2024.
//

import SwiftUI

struct ProductListView: View {

    @ObservedObject private var productListViewModel: ProductListViewModel
    
    init(productListViewModel: ProductListViewModel) {
        self.productListViewModel = productListViewModel
    }
    
    var body: some View {
        NavigationStack{
            
            if productListViewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListLayout(items: productListViewModel.products)
                    .overlay {
                        if productListViewModel.isError {
                            ErrorView(errorTitle: AppConstant.errorTitle, errorDescription: productListViewModel.error) {
                                Task {
                                    await fetchProducts()
                                }
                            }
                        }
                    }
                .navigationTitle(AppConstant.productListTitle)
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .task {
            await fetchProducts()
        }
    }
    
    private func fetchProducts() async {
        await productListViewModel.fetchProducts()
    }
    
}

//#Preview {
//    ProductListView()
//}


/*
 When opening detail screen
 
 struct MyCollectionView: View {
     @Namespace var namespace

     var body: some View {
         ScrollView {
             LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                 ForEach(0..<20) { index in
                     Rectangle()
                         .foregroundColor(.blue)
                         .frame(height: 100)
                         .cornerRadius(10)
                         .matchedGeometryEffect(id: index, in: namespace)
                         .onTapGesture {
                             withAnimation {
                                 // Show detailed view
                             }
                         }
                 }
             }
         }
     }
 }
 */
