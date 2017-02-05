//
//  BackgroundBehaviorController.swift
//  StockChecker
//
//  Created by Daniel on 2/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Alamofire
import Gloss

class BackgroundBehaviorController {
    
    // gets the array of stocks exactly once
    let stockObjects: [StockObject]!
    let dataController = DataController()
    let serverUrlAsString = "http://dev.markitondemand.com/MODApis/Api/v2/Quote/json?symbol="
    
    init() {
    
        stockObjects = dataController.load()!
    }
    
    // polls the server for the last stock prices and sets the price accordingly in this class's stock objects.
    func pollServerForLastStockPrices() {
        
        for stockObject in stockObjects {
            
            Alamofire.request(serverUrlAsString + stockObject.stockTicker!, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                
                let json = response.result.value as! JSON
                print("JSON: \(json)")
                
                let stock = StockObject(json: json)
                print(stock.lastPollData.lastPrice!)
            }
        }
    }
}
