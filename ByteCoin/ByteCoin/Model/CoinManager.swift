//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdaterate(rate: Double)
    func didFailWithError(error: Error)
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "ADB3743B-458B-47F3-9438-17522A660099"
    //https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=ADB3743B-458B-47F3-9438-17522A660099
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        print(currency)
        performRequest(urlString: "\(baseURL)/\(currency)?apikey=\(apiKey)")
    }
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in //클로저
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let rate = self.parseJSON(safeData){
                        self.delegate?.didUpdaterate(rate: rate)
                        
                    }
                }
            }
            task.resume()
        }
    
        
    }
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do{
            
            let decodedData = try decoder.decode(CoinModel.self, from: coinData)
            let rate = decodedData.rate
            return rate
            
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
