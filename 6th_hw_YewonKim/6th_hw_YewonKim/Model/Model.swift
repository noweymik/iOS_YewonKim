//
//  Model.swift
//  6th_hw_YewonKim
//
//  Created by yewoni on 5/8/24.
//

import UIKit

struct MemberData: Decodable, Encodable {
    let id: Int?
    let name: String
    let part: String
    let age: Int
    
    init(id: Int? = nil, name: String, part: String, age: Int) {
        self.id = id
        self.name = name
        self.part = part
        self.age = age
    }
}
