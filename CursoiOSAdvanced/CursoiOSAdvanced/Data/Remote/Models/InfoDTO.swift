//
//  InfoDTO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

struct InfoDTO: Codable { // direct transfer object. el codable es para conseguir el .json
    let seed: String?
    let count: Int?
    let page: Int?
    let version: String?
    
    private enum CondingKeys: String, CodingKey {
        case seed
        case count = "results"
        case page
        case version
    }
}
