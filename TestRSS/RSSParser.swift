//
//  RSSParser.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-26.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation

class RSSParser:NSObject, XMLParsable {
    typealias T = Article
    
    var link: String =  "http://www.cbc.ca/cmlink/rss-topstories"
    var parser:XMLParser!
    var current: [String : String]? = nil
    var output: Array<Article> = []
    var element: String = ""
    
    func parse(completion: (ParseState<Article>) -> Void) {
        
        guard let url = URL(string: link) else { return }
        parser = XMLParser(contentsOf: url)
        parser?.delegate = self
        if let flag = parser?.parse() {
            
            if flag {
                completion(ParseState.success(output))
            }else{
                completion(ParseState.error(parser.parserError))
            }
        }
    }
}


extension RSSParser: XMLParserDelegate{
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        defer {
            if elementName == "item"{
                current = [String:String]()
            }
        }
        guard current != nil else { return }
        if elementName == "description" {
            element = "image"
        }else{
            element = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if element == "image" {
            guard let string = String(data: CDATABlock, encoding: .utf8) else { return }
            guard let imageUrl = string.subString(from: "src='", to: "'") else { return }
            current?[element] = imageUrl
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard current != nil else { return }
        let foundCharacters = current?[element] ?? ""
        var value = foundCharacters + string
        if element != "image" {
            current?[element] = value
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            if let current = current {
                output.append(Article.map(source: current))
            }
            current = nil
            element = ""
        }
    }
    
}
