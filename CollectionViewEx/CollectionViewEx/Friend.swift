//
//  Friend.swift
//  CollectionViewEx
//
//  Created by dev.geeyong on 2020/12/28.
//

import Foundation

struct Friend: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
           case cityName = "city_name"
           case rainfallProbability = "rainfall_probability"
           
           case state
           case celsius
       }
}
