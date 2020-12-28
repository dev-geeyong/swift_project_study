//
//  Friend.swift
//  CollectionViewEx
//
//  Created by dev.geeyong on 2020/12/28.
//

import Foundation

struct Friend: Codable {
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    
    var nameAndAge: String{
        return self.name + "(\(self.age))"
    }
    
    var fullAddress: String{
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
    
    enum Codingkeys: String, CodingKey{
        case name, age
        case addressInfo = "address_info"
    }
}
