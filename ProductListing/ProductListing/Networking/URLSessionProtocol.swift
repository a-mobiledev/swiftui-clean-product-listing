//
//  URLSessionProtocol.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//


import Foundation
protocol URLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?)
}
extension URLSession: URLSessionProtocol {
    
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        return try await self.data(for: request)
    }
}
