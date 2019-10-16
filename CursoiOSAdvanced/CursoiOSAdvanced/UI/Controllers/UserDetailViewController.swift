//
//  UserDetailViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
        
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var buttonPressed: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // segmentOptions.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        configure(tableView: tableView)
    }
//    override func performSegue(withIdentifier: "UserDetail", sender: PersonalDataViewCell) {
//
//    }
    
}

// MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        // esta función es para contar el numero de elementos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier, for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
//        if (indexPath.row < users.count) {
//            let user = users[indexPath.row]
//            cell.configureCell(image: user.avatar, name: user.name, email: user.email, birthdate: user.birthdate, nationality: user.nationality)
//        }
        return cell
    }
}
