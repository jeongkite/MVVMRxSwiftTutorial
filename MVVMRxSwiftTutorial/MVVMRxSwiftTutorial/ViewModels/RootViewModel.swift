//
//  RootViewModel.swift
//  MVVMRxSwiftTutorial
//
//  Created by 양정연 on 2023/03/17.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "Incredible News"
    
    private let articleService: ArticleServiceProtocol
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[Article]> {
        articleService.fetchNews()
    }
    
}
