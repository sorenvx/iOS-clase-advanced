//
//  ApiManager.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

enum ServiceResult { //si es success devuelve cualquier cosa que se pida, si no, devuelve un mensaje diciendo que ha fallado
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    private let numUsers: Int = 100
    
    func fetchUsers(completion: ServiceCompletion) { //llamar al servicio, cargar los datos y devolverlos
        //llamar al servicio
        let users = testLoadUsersJson()
        completion( .success(data: users))
    }
    private func testLoadUsersJson() -> UsersDTO? {
        // Llamar al servicio
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                return try decoder.decode(UsersDTO.self, from: jsonData)
            }
            catch let error {
                print("parse error: \(error.localizedDescription)")
                return nil
            }
        }
        else {
            print("Invalid filename/path.")
            return nil
        }
    }
}


