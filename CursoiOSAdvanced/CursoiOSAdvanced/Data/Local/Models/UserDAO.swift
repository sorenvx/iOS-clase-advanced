//
//  UserDAO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation
import RealmSwift


class UserDAO: Object { //direct access object
    
    @objc dynamic var gender: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var country: String?
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?
    @objc dynamic var email: String?
    @objc dynamic var uuid: String = ""
    @objc dynamic var birthdate: Date?
    @objc dynamic var avatar: String?
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
    convenience init(uuid: String,
                     avatar: String? = nil,
                     firstName: String? = nil,
                     gender: String? = nil,
                     lastName: String? = nil,
                     country: String? = nil,
                     latitude: String? = nil,
                     longitude: String? = nil,
                     email: String? = nil,
                     birthdate: Date? = nil) {
        self.init()
        self.uuid = uuid
        self.avatar = avatar
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.email = email
        self.birthdate = birthdate
        
    }
}


