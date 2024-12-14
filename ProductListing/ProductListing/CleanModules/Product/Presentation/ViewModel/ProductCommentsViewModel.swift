//
//  ProductCommentsViewModel.swift
//  ProductListing
//
//  Created by Asad Mehmood on 05/12/2024.
//

import Foundation

protocol ProductCommentsViewModelProtocol: ObservableObject {
    
    var comments: [ProductCommentViewModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    
    func shouldShowLoader() -> Bool
    func fetchComments() async
}

class ProductCommentsViewModel: ProductCommentsViewModelProtocol {
    @Published var comments: [ProductCommentViewModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return comments.isEmpty }
    
    private let commentsUseCase: ProductCommentsUseCase
    
    init(useCase: ProductCommentsUseCase) {
        self.commentsUseCase = useCase
    }
    
    func fetchComments() async {
        do {
            let comments = try await commentsUseCase.fetchProductComments()
            self.comments = transformFetchedComments(comments: comments)
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
    func transformFetchedComments(comments: [ProductDomainCommentsDTO]) -> [ProductCommentViewModel] {
        return comments.map { ProductCommentViewModel(id: $0.commentId, body: $0.body, likes: $0.likes, userName: $0.user.username, fullName: $0.user.fullname)}
    }
    func shouldShowLoader() -> Bool {
        self.comments.isEmpty && !isError
    }
}
    
    
    
    
    
    
    
    
    
    
    
