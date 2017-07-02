//
//  ArticlesViewModel.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-30.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit

protocol ArticlesViewModelDelegate: class {
    func articlesDidStartLoading()
    func articlesDidFinishLoading()
    func articlesDidFailLoading(with error:String)
}

class ArticlesViewModel: NSObject {
    var delegate:ArticlesViewModelDelegate?
    var articles:[Article] = []
    
    
    required init(delegate: ArticlesViewModelDelegate?) {
        self.delegate = delegate
        super.init()
    }
    
    func fetchArticles(){
        self.delegate?.articlesDidStartLoading()
        let parser = RSSParser()
        parser.parse { state in
            switch state{
            case .success(let articles):
                self.articles = articles
                self.delegate?.articlesDidFinishLoading()
            case .error(let error):
                let errorMsg = error?.localizedDescription ?? "Unable to load articles"
                self.delegate?.articlesDidFailLoading(with: errorMsg)
            }
        }
    }
}
