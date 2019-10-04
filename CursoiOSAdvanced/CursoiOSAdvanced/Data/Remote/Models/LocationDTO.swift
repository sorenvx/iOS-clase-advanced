//
//  LocationDTO.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

struct LocationDTO: Codable {
    let street: StreetDTO?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    let coordinates: CoordinatesDTO?
    let timezone: TimezoneDTO?
}
