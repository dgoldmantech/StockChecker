//
//  LastPollDataObject.swift
//  StockChecker
//
//  Created by Daniel on 1/21/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

class LastPollDataObject {
    
    var timestamp: String!
    var result: String!
    
    init(timestamp: String?, result: String?) {
        
        self.timestamp = timestamp
        self.result = result
    }
}