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

//private func testLoadUsersJson2() -> UsersDTO? {
//
//}

//// Paso un string a diccionario
//if let dataUser = jsonUserString.data(using: .utf8),
//    let user = try? JSONSerialization.jsonObject(with: dataUser, options: []) as? [String : Any] {
//        print(user)
//
//    // Como crear un objeto con código a mano
//    let nameUserCodigo = NameDTO(title: "Mr", first: "Sansao", last: "Ferreira")
//    let userCodigo = UserDTO(gender: "male", name: nameUserCodigo)
//    print(userCodigo)
//
//    // Paso el string a structs
//    let decoder = JSONDecoder()
//    if let userDTO = try? decoder.decode(UserDTO.self, from: dataUser) {
//       print(userDTO)
//    }
//
//}
