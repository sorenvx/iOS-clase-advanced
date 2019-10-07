//
//  DataManager.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import Foundation

class DataManager {
    // MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    
    
    func users(completion: ServiceCompletion) {
        let users = usersDB()
        if usersDB().count > 0 {
            //devolver usersDB
            completion(.success(data: users))
        } else {
            // llamar al servicio y guardar usuarios en base de datos
            usersForceUpdate(completion: completion)
        }
    }
    
    func usersForceUpdate(completion: ServiceCompletion) {
        //llamas al servicio
        ApiManager.shared.fetchUsers() { result in
            //hay que obetener el case del enumerado para que si es succes devuelva los users
            switch result {
            case .success(let data):
                guard let users = data as? UsersDTO else {
                    completion(.failure(msg: "Mensaje de erros"))
                    return
                }
                
                // eliminar los usuarios de la base de datos
                DatabaseManager.shared.deleteAll()
                //guardar usuarios en base de datos
                save(users: users)
                completion(.success(data: users)) //contestar
                
            case .failure(let msg):
                print("Fallo al obtener usuarios del servicio: \(msg) ")
            }
            
        }
        
        
    }
    func user(id: String) -> UserDAO? {
        return DatabaseManager.shared.user(by: id) //shared siempre nos va a devolver la mimsma estancia de la clase
    }
    
    private func usersDB() -> Array<UserDAO> { //son privadas porque solo se van a utilizar desde aquí
        return Array(DatabaseManager.shared.users())
    }
    
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
            return
        }
        usersToSave.forEach{ save(user: $0) }
    }
    
    private func save(user: UserDTO) {
        guard let userId = user.email else {
            return
        }
        let userDB = UserDAO(uuid: userId,
                             avatar: user.picture?.large,
                             firstName: user.name?.first,
                             gender: user.gender,
                             lastName: user.name?.last,
                             country: user.location?.country,
                             latitude: user.location?.coordinates?.latitude,
                             longitude: user.location?.coordinates?.longitude,
                             email: user.email,
                             birthdate: user.dob?.date)
        
        DatabaseManager.shared.save(user: userDB)
    }
    
}
