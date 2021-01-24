//
//  User.swift
//  HelloRealms
//
//  Created by 副島拓哉 on 2021/01/24.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
