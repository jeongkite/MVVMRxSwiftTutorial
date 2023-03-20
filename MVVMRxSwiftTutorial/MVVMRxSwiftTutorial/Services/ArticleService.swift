//
//  ArticleService.swift
//  MVVMRxSwiftTutorial
//
//  Created by 양정연 on 2023/03/17.
//

import Foundation
import Alamofire
import RxSwift

protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class ArticleService: ArticleServiceProtocol {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                if let articles = articles {
                    observer.onNext(articles)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-20&sortBy=publishedAt&apiKey=669cb8650e3244c487cb2a43f0a0d3af"
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "jeongkite", code: 404, userInfo: nil), nil)}
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        }
    }
}
