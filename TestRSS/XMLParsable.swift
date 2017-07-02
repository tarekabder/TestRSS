//
//  XMLParsable.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-30.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation

enum ParseState<T>{
    case success([T])
    case error(Error?)
}

protocol XMLParsable {
    associatedtype T : Mappable
    
    var link:String { get }
    var parser:XMLParser! {get set}
    var element:String {get set}
    var current:[String:String]? {get set}
    var output:Array<T> {get set}
    
    func parse(completion:(ParseState<T>)->Void)
}
