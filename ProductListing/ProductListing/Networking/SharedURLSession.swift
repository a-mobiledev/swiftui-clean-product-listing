//
//  SharedURLSession.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//


import Foundation

final class SharedURLSession {
    
    static var shared: URLSession {
        let configuration = URLSessionConfiguration.default
        let delegate = SharedURLSessionDelegate()
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }
}
