//
//  ArticleTableViewCell.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-07-01.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit
import Nuke

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    func configure(vm: ArticleCellModel )  {
        
        if let url = URL(string: vm.imageUrl){
            Nuke.loadImage(with: url, into: articleImage)
        }

        titleLabel.text = vm.title
        authorLabel.text = vm.author
        dataLabel.text = vm.date
    }
}

extension ArticleTableViewCell : Reusable {
    static var cellIdentifier:String {
        return "ArticleTableViewCell"
    }
}
