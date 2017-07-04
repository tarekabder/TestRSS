//
//  WebViewable.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-07-03.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation
import  UIKit

protocol WebViewable : class{
    var webTitle:String {get set}
    var webLink:String {get set}
    func load(in webView:UIWebView)
}

extension WebViewable where Self : UIViewController {
    func load(in webView:UIWebView){
        guard let url = URL(string: webLink) else { return }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
}
