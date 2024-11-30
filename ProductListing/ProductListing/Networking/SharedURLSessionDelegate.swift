//
//  SharedURLSessionDelegate.swift
//  ProductListing
//
//  Created by Asad Mehmood on 30/11/2024.
//


import Foundation

final class SharedURLSessionDelegate: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        challenge.trustServer { challangeDisposition, credential in
            completionHandler(challangeDisposition,credential)
        }
    }
}
