//
//  FeedViewController.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-17.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    var vm:ArticlesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup() {
        vm = ArticlesViewModel(delegate: self)
        vm.fetchArticles()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: ArticleTableViewCell.cellIdentifier() , bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: ArticleTableViewCell.cellIdentifier() )
    }
}

extension FeedViewController : ArticlesViewModelDelegate {
    func articlesDidStartLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func articlesDidFinishLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.tableView.reloadData()
    }
    
    func articlesDidFailLoading(with error: String) {
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension FeedViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleModel = vm.articleModel(at: indexPath)
        let cell:ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellIdentifier()) as! ArticleTableViewCell
        cell.configure(vm: articleModel)
        
        return cell
    }
}
