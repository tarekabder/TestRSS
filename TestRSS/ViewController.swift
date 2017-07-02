//
//  ViewController.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-17.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vm:ArticlesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        vm = ArticlesViewModel(delegate: self)
        vm.fetchArticles()
    }
}

extension ViewController : ArticlesViewModelDelegate {
    func articlesDidStartLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func articlesDidFinishLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print(vm.articles)
    }
    
    func articlesDidFailLoading(with error: String) {
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
