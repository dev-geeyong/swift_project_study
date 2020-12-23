//
//  UserInformation.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import Foundation

class UserInformation {
    static let sharedData: UserInformation = UserInformation()
    
    var phoneNumber: String? //전화번호
    var dateValue: String? //달력 값
    var userId: String? // ID 값
    
    
}
