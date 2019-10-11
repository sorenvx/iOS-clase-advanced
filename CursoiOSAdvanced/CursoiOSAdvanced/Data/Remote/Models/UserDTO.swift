//
//  UserDTO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

struct UserDTO: Codable {
    let gender: String?
    let name: NameDTO?
    let location: LocationDTO?
    let email: String?
    let login: LoginDTO?
    let dob: DobDTO?
    let registered: RegisteredDTO?
    let phone: String?
    let cell: String?
  //  let id: IdDTO?
    let picture: PictureDTO?
    let nat: String?
    
}
