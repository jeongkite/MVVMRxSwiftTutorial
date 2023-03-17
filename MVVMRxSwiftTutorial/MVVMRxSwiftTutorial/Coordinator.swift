//
//  Coordinator.swift
//  MVVMRxSwiftTutorial
//
//  Created by 양정연 on 2023/03/17.
//

import UIKit

class Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
    }
}
