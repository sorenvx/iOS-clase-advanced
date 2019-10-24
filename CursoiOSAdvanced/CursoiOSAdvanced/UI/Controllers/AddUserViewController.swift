//
//  AddUserViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit


class AddUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    private enum AddUserCellType: Int {
        
        case name = 0
        case email
        case gender
        case birthdate
        case nationality
        case country
        case coordinates
    }
    
    private let cellTypes = [AddUserCellType.name, AddUserCellType.email, AddUserCellType.gender, AddUserCellType.birthdate, AddUserCellType.nationality, AddUserCellType.country, AddUserCellType.coordinates]
    
    
    override func viewDidLoad() {
        self.tableView.rowHeight = 171.0
        configure(tableView: tableView)
        title = "Add new user"
        
    }
    
    
}

extension AddUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func configure(tableView: UITableView) {
           tableView.dataSource = self
           tableView.delegate = self
           
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch cellTypes[indexPath.row] {
        
        case .name:
            cell = cellName(tablewView: tableView, indexPath: indexPath)
        case .email:
            cell = cellEmail(tablewView: tableView, indexPath: indexPath)
        case .gender:
            cell = cellGender(tablewView: tableView, indexPath: indexPath)
        case .birthdate:
            cell = cellBirthdate(tablewView: tableView, indexPath: indexPath)
        case .nationality:
            cell = cellNationality(tablewView: tableView, indexPath: indexPath)
        case .country:
            cell = cellCountry(tablewView: tableView, indexPath: indexPath)
        case .coordinates:
            cell = cellCoordinates(tablewView: tableView, indexPath: indexPath)
        
        }
        return cell
    }
    
    
    
    
    
    
    func cellName(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NameCell.cellIdentifier, for: indexPath) as? NameCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func cellEmail(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.cellIdentifier, for: indexPath) as? EmailCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func cellGender(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenderCell.cellIdentifier, for: indexPath) as? GenderCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func cellBirthdate(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BirthdateCell.cellIdentifier, for: indexPath) as? BirthdateCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func cellNationality(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NationalityCell.cellIdentifier, for: indexPath) as? NationalityCell else {
            return UITableViewCell()
        }
        return cell
    }
    func cellCountry(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.cellIdentifier, for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func cellCoordinates(tablewView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoordinatesCell.cellIdentifier, for: indexPath) as? CoordinatesCell else {
            return UITableViewCell()
        }
        return cell
    }
}

