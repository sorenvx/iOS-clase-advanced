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
//        self.tableView.rowHeight = 165.0
        //        heightRow()
        configure(tableView: tableView)
        
        
    }
    
    func heightRow() {
        if tableView.tag == 1 && tableView.tag == 2 {
            self.tableView.rowHeight = 165.0
        } else if tableView.tag == 3 {
            self.tableView.rowHeight = 212.0
        } else if tableView.tag == 4 {
            self.tableView.rowHeight = 126.0
        } else if tableView.tag == 5 {
            self.tableView.rowHeight = 105.0
        } else if tableView.tag == 6 {
            self.tableView.rowHeight = 138.0
        } else if tableView.tag == 7 {
            self.tableView.rowHeight = 250.0
        }
    }
    
    
}

extension AddUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func configure(tableView: UITableView) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat = 171.0
        
        switch cellTypes[indexPath.row] {
        case .name:
            cellHeight = NameCell.cellHeight
        case .email:
            cellHeight = EmailCell.cellHeight
        case .gender:
            cellHeight = GenderCell.cellHeight
        case .birthdate:
            cellHeight = BirthdateCell.cellHeight
        case .nationality:
            cellHeight = NationalityCell.cellHeight
        case  .country:
            cellHeight = CountryCell.cellHeight
        case .coordinates:
            cellHeight = CoordinatesCell.cellHeight
        }
        
        return cellHeight
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

