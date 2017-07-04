//
//  WebViewController.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-07-03.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, WebViewable {
    
    @IBOutlet weak var webView: UIWebView!
    var webTitle: String = ""
    var webLink: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = webTitle
        self.load(in: webView)
    }
}
