//
//  String+Extension.swift
//  TestRSS
//
//  Created by tarek abderrazik on 17-06-30.
//  Copyright © 2017 Tarek Abderrazik. All rights reserved.
//

import Foundation

extension String {
    func subString(from str1:String,to str2:String) -> String? {
        guard let startIndex = self.range(of: str1)?.upperBound else {
            return nil
        }
        guard let endIndex = self.range(of: str2, options: .literal, range: startIndex..<self.endIndex, locale: nil)?.lowerBound else {
            return nil
        }
        
        return self.substring(with: startIndex..<endIndex)
        
    }
}
