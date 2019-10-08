//
//  User.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 08/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

class User {
    let id: String?
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let birthdate: Date?
    let country: String?
    let nat: String?
    
    var name: String {
        return "\(String(describing: firstName)) \(String(describing: lastName))"
    }
    
    var age: Int {
        guard let date = birthdate else {
            return 0
        }
        let ageComponent = Calendar.current.dateComponents([.year], from: date, to: Date())
        
        return ageComponent.year ?? 0
        
    }
    
    
    init(id: String, avatar: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, country: String? = nil, nat: String? = nil, birthdate: Date? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nat = nat
    }
}
