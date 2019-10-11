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
    
    
    
    func users(completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let users = self?.usersFromUsersDB(), users.count > 0 {
                //devolver usersDB
                DispatchQueue.main.async {
                    completion(.success(data: users))
                }
            } else {
                // llamar al servicio y guardar usuarios en base de datos
                self?.usersForceUpdate(completion: completion)
            }
        }
    }
    
    func usersForceUpdate(completion: @escaping ServiceCompletion) { //se pone escaping para que no elimine la información
        //llamas al servicio para obtener nuevos usuarios
        
        DispatchQueue.global(qos: .background).async {
            ApiManager.shared.fetchUsers() {[weak self] result in //weak self porque un self en un closure suma +1
                //hay que obetener el case del enumerado para que si es succes devuelva los users
                switch result {
                case .success(let data):
                    guard let usersDTO = data as? UsersDTO else {
                        DispatchQueue.main.async {
                            completion(.failure(msg: "Mensaje de error"))
                        }
                        return
                    }
                    
                    // eliminar los usuarios de la base de datos
                    DatabaseManager.shared.deleteAll()
                    //guardar usuarios en base de datos
                    self?.save(users: usersDTO)
                    
                    let users = self?.usersFromUsersDB()
                    
                    
                    DispatchQueue.main.async {
                        completion(.success(data: users))
                    }
                    // completion(.success(data: users)) //contestar
                    
                case .failure(let msg):
                    print("Fallo al obtener usuarios del servicio: \(msg) ")
                    
                    DispatchQueue.main.async {
                        completion(.failure(msg: msg))
                    }
                }
                
            }
            
        }
    }
    //    func user() -> UserDAO? { //buscando ususario por id
    //
    //        return DatabaseManager.shared.user(by: id) //shared siempre nos va a devolver la mimsma estancia de la clase
    //    }
    func user(by id: String, completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let userDAO = DatabaseManager.shared.user(by: id) {
                let user = self?.user(from: userDAO)
                
                DispatchQueue.main.async {
                    completion(.success(data: user))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(msg: "No se ha encontrado el usuario"))
                }
            }
        }
    }
    
    private func usersDB() -> Array<UserDAO> { //son privadas porque solo se van a utilizar desde aquí, no se pueden utilizar desde otras sitios.
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
                                birthdate: user.dob?.date,
                                nationality: user.nat)
           
           DatabaseManager.shared.save(user: userDB)
       }
    
    private func usersFromUsersDB() -> Array<User> {
           let usersDAO = usersDB()
           
           return users(from: usersDAO)
       }
    
    private func users(from usersDAO: Array<UserDAO>) -> Array<User> {
        return usersDAO.compactMap { userDAO in
            return self.user(from: userDAO)
        }
    }
    
    private func user(from userDAO: UserDAO) -> User {
        return User(id: userDAO.uuid,
                    avatar: userDAO.avatar,
                    firstName: userDAO.firstName,
                    lastName: userDAO.lastName,
                    email: userDAO.email,
                    country: userDAO.country,
                    nationality: userDAO.nationality,
                    birthdate: userDAO.birthdate)
    }
    
   
   
}
