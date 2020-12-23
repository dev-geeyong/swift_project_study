//
//  Friends.swift
//  JsonDecoder
//
//  Created by dev.geeyong on 2020/12/23.
//
//{
//        "name":"하나",
//        "age":22,
//        "address_info": {
//            "country":"대한민국",
//            "city":"울산"
//        }
//    },

import Foundation

struct Friends: Codable{
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Int
    
}

