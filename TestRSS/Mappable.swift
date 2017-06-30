//
//  Mappable.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-30.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation

protocol Mappable {
    associatedtype T
    associatedtype U
    
    static func map(source: T) -> U
}
