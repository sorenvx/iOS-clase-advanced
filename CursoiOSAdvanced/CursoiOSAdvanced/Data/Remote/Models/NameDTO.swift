//
//  NameDTO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

struct NameDTO: Codable { // direct transfer object. el codable es para conseguir el .json
    let title: String?
    let first: String?
    let last: String?
}
