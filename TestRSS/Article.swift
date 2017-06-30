//
//  Article.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-22.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation

struct Article : Mappable{
    typealias T = [String:String]
    typealias U = Article
    
    var title:String
    var author:String
    var imageUrl:String
    var date:String
    var webLink:String

    static func map(source: [String:String]) -> Article {
        
        return self.init(
            title: source["title"] ?? "",
            author: source["author"] ?? "",
            imageUrl: source["image"] ?? "",
            date: source["pubDate"] ?? "",
            webLink: source["link"] ?? ""
        )
    }
    
}
