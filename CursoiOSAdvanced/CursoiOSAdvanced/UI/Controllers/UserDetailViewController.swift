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
        
        
        // - MARK: Maps
        
        
        
    }
    private var users: Array<User> = []
    
    
}



// MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count   // esta función es para contar el numero de elementos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalDataViewCell.cellIdentifier, for: indexPath) as? PersonalDataViewCell else {
            return UITableViewCell()
        }
        
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(image: user.avatar, name: user.firstName, gender: user.gender, birthdate: user.birthdate, lastName: user.lastName, city: user.city)
        }
        
        return cell
    }
}

