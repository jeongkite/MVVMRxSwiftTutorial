//
//  ArticleViewModel.swift
//  MVVMRxSwiftTutorial
//
//  Created by 양정연 on 2023/03/17.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var imageUrl: String? {
        return article.urlToImage
    }
    
    var title: String? {
        return article.title
    }
    
    var description: String? {
        return article.description
    }
    
    init(article: Article) {
        self.article = article
    }
}
