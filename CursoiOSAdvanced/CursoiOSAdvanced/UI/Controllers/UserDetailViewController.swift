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
        
        
    }
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // segmentOptions.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        configure(tableView: tableView)
        self.tableView.rowHeight = 171.0
        
        
        // - MARK: Maps
        
        
        
    }
    private var users: Array<User> = []
    
    
}
//
//enum CustomElementType: UIView {
//    case personalData(view: UIView)
//    case mapView(view: UIView)
//    case country(view: UIView)
//    case contact(view: UIView)
//}


// MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MapViewCell.cellIdentifier, for: indexPath) as? MapViewCell else {
                   return UITableViewCell()
               }
               
               if (indexPath.row < users.count) {
                   let user = users[indexPath.row]
                cell.configureCell(latitude: user.latitude, longitude: user.longitude)
               }
//        switch tableView.tag {
//        case 1:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalDataViewCell.cellIdentifier, for: indexPath) as? PersonalDataViewCell else {
//                return UITableViewCell()
//            }
//
//            if (indexPath.row < users.count) {
//                let user = users[indexPath.row]
//                cell.configureCell(image: user.avatar, name: user.firstName, gender: user.gender, birthdate: user.birthdate, lastName: user.lastName, city: user.city)
//            }
//        case 2:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: MapViewCell.cellIdentifier, for: indexPath) as? MapViewCell else {
//                return UITableViewCell()
//            }
//
//            if (indexPath.row < users.count) {
//                let user = users[indexPath.row]
//
//            }
//        case 3:
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryViewCell.cellIdentifier, for: indexPath) as? CountryViewCell else {
//            return UITableViewCell()
//        }
//
//        if (indexPath.row < users.count) {
//            let user = users[indexPath.row]
//            cell.configureCell(country: user.country, flag: nil)
//        }
//        case 4:
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataViewCell.cellIdentifier, for: indexPath) as? ContactDataViewCell else {
//            return UITableViewCell()
//        }
//
//        if (indexPath.row < users.count) {
//            let user = users[indexPath.row]
//            cell.configureCell(email: user.email, phone: user.phone, street: user.street)
//        }
//        default:
//            return UITableViewCell()
//        }
        return cell
    }

}




