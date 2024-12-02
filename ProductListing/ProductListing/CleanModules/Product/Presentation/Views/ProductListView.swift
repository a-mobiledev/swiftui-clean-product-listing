//
//  ContentView.swift
//  ProductListing
//
//  Created by Asad Mehmood on 27/11/2024.
//

import SwiftUI

struct ProductListView<ViewModel>: View where ViewModel: ProductListViewModelProtocol {

    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            
            if viewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListLayout(items: viewModel.products)
                    .overlay {
                        if viewModel.isError {
                            ErrorView(errorTitle: AppConstant.errorTitle, errorDescription: viewModel.error) {
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
        await viewModel.fetchProducts()
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
