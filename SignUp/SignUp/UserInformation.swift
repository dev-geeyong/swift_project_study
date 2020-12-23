//
//  UserInformation.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import Foundation
//
//상속할 필요가 없는 class는 final 키워드를 앞에 붙여
//
//약간의 성능 개선효과를 볼 수 있습니다
final class UserInformation {
    static let sharedData: UserInformation = UserInformation()
    
    var phoneNumber: String? //전화번호
    var dateValue: String? //달력 값
    var userId: String? // ID 값
    
//    싱글턴 클래스는 보통 내부에서 생성한 static let 프로퍼티를 제외하고 외부에서 생성하지 못하는 것이 원칙이므로,
//
//    생성자를 private으로 선언하여 외부에서 생성되지 못하도록 막는 것이 일반적입니다.
}
