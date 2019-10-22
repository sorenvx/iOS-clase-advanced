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
    let nationality: String?
    let gender: String?
    let latitude: String?
    let longitude: String?
    let city: String?
    let street: String?
    let phone: String?

    
    var name: String {
        var userName = ""
        if let userFirstName = firstName {
            userName += userFirstName
            
        }
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? " \(userLastName)": userLastName)
        }
        return "\(userName)"
    }
    
    var age: Int {
        guard let date = birthdate, let ageComponent = Calendar.current.dateComponents([.year], from: date, to: Date()).year else {
            return 0
        }
        
        
        return ageComponent
        
    }
    
    
    init(id: String, avatar: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, country: String? = nil, nationality: String? = nil, birthdate: Date? = nil, gender: String? = nil, latitude: String? = nil, longitude: String? = nil, city: String? = nil, street: String? = nil, phone: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
        self.gender = gender
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.street = street
        self.phone = phone
    }
}
