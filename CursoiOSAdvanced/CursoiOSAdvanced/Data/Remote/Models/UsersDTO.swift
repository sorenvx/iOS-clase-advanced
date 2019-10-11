//
//  UsersDTO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation // direct transfer object


struct UsersDTO: Codable { // direct transfer object. el codable es para conseguir el .json
    let users: Array<UserDTO>?
    let info: InfoDTO?
    
    private enum CodingKeys: String, CodingKey {
        case users = "results"
        case info
    }
    
}

