//
//  UserDetailViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit
import MapKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func buttonPressed(_ sender: UIButton) {
        let alert =  UIAlertController(title: "Eliminar usuario", message: "Vas a eliminar el usuario, ¿estás seguro?", preferredStyle: .alert) // tipo de view controller especial
        alert.addAction(UIAlertAction(title: "eliminar", style: .destructive, handler: { [weak self] _ in
            
            guard let userId = self?.user?.id else {
                return
            }
            DataManager.shared.delete(user: userId) { _ in
                self?.navigationController?.popViewController(animated: true) // lo saca de la pila y se muestra el anterior
                    // tener cuidado al poner self en un closure, tiene que ser weak (para que sea opcional), y que no sume +1.
            }
        }))
        
        alert.addAction(UIAlertAction(title: "cancelar", style: .cancel))
        present(alert, animated: true) // mostrar la alerta en pantalla (y con los dos addAction se configura el aceptar y el eliminar)
    }
    
    private enum UserDeatilCellType: Int {
        
        case personalData = 0
        case map
        case location
        case contact
        
    }
    
    
    private let cellTypes = [UserDeatilCellType.personalData, UserDeatilCellType.map, UserDeatilCellType.location, UserDeatilCellType.contact]
    
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // segmentOptions.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        configure(tableView: tableView)
        self.tableView.rowHeight = 171.0
        title = user?.name
        // - MARK: Maps
    }
}


// MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        var cell = UITableViewCell()
        
        switch cellTypes[indexPath.row] { // la posicion la indica el indexpath.row
        case .personalData:
            cell = cellPersonalData(tablewView: tableView, indexPath: indexPath)
        case .map:
            cell = cellMap(tablewView: tableView, indexPath: indexPath)
        case .location:
            cell = cellLocation(tablewView: tableView, indexPath: indexPath)
        case .contact:
            cell = cellContact(tablewView: tableView, indexPath: indexPath)
        }
        
        return cell
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var cellHeight: CGFloat = 0
//
//        switch cellTypes[indexPath.row] {
//            case .personalData:
//                cellHeight = PersonalDataViewCell.cellHeight
//
//            case .map:
//                cellHeight = MapViewCell.cellHeight
//
//            case .location:
//                cellHeight = CountryViewCell.rowHeight
//
//            case .contact:
//                cellHeight = ContactDataViewCell.cellHeight
//        }
//
//        return cellHeight
//    }
    
    func cellPersonalData(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalDataViewCell.cellIdentifier, for: indexPath) as? PersonalDataViewCell else {
            return UITableViewCell()
        }
        
        //configure cell data
        cell.configureCell(image: user?.avatar,
                           name: user?.firstName,
                           gender: user?.gender,
                           birthdate: user?.birthdate,
                           lastName: user?.lastName,
                           city: user?.city)
        
        return cell
    }
    
    func cellMap(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MapViewCell.cellIdentifier, for: indexPath) as? MapViewCell else {
            return UITableViewCell()
        }
        
        //configure cell data
        cell.configureCell(latitude: user?.latitude, longitude: user?.longitude)
        return cell
    }
    func cellLocation(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryViewCell.cellIdentifier, for: indexPath) as? CountryViewCell else {
            return UITableViewCell()
        }
        
        //configure cell data
        cell.configureCell(country: user?.country, nationality: user?.nationality)
        return cell
    }
    
    func cellContact(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataViewCell.cellIdentifier, for: indexPath) as? ContactDataViewCell else {
            return UITableViewCell()
        }
        
        //configure cell data
        cell.configureCell(email: user?.email, phone: user?.phone, street: user?.street)
        return cell
    }
}


