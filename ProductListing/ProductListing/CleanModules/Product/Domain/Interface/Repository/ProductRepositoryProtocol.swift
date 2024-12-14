//
//  ProductListRepository.swift
//  ProductListing
//
//  Created by Asad Mehmood on 29/11/2024.
//

import Foundation

protocol ProductListRepository {
    func fetchProductList() async throws -> [ProductDomainListDTO]
    
}
