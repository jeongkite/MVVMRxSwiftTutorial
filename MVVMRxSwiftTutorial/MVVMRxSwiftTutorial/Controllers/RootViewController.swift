//
//  RootViewController.swift
//  MVVMRxSwiftTutorial
//
//  Created by 홍주은 on 2023/03/17.
//

import UIKit
import RxSwift
import RxRelay

class RootViewController: UIViewController {
    
    // MARK: Properties
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel
    
    private let articles = BehaviorRelay<[Article]>(value: [])
    var articlesObserver: Observable<[Article]> {
        return articles.asObservable()
    }
    
    // MARK: Lifecycles
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        fetchArticles()
        subscribe()
    }
    
    // MARK: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    // MARK: Helpers
    func fetchArticles() {
        self.viewModel.fetchArticles().subscribe(onNext: { articles in
            self.articles.accept(articles)
        }).disposed(by: disposeBag)
    }
    
    func subscribe() {
        self.articlesObserver.subscribe(onNext: { articles in
            // collectionView 생성 예정, 이때 reloadData() 필요
        }).disposed(by: disposeBag)
    }
    
}
