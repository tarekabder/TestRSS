//
//  ArticleCellModel.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-22.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit

class ArticleCellModel: NSObject {
    private var article:Article
    
    var title:String {
        var str = article.title.clean
        return (str.characters.count > 0) ? str : "Article"
    }
    var author:String { return article.author }
    var date:String { return article.date }
    var imageUrl:String { return article.imageUrl }
    
    
    init(article:Article) {
        self.article = article
    }

}
