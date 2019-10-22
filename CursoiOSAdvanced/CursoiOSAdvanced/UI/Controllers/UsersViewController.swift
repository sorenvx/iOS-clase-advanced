//
//  UsersViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentOptions: UISegmentedControl!
    
    // Value changed, cuando se modifica el valor
    @IBAction func onListTypePressed(_ sender: UISegmentedControl) {
        
        //save selected option
        DataManager.shared.save(optionSelected: sender.selectedSegmentIndex)
        updateTypeList(optionSelected: sender.selectedSegmentIndex)
        
    }
    
    private var cellSpacing: CGFloat = 16.0
    private var users: Array<User> = []
    private let refreshControlTB = UIRefreshControl()
    private let refreshControlCV = UIRefreshControl()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        // segmentOptions.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        configure(tableView: tableView)
        configure(collectionView: collectionView)
        loadOptionSelected()
        loadUsers()
      
    }

    private func configureRefreshControl() {
        // Configure Refresh Control
        refreshControlTB.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
        refreshControlCV.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
    }
  
    private func loadOptionSelected() {
        segmentOptions.selectedSegmentIndex = DataManager.shared.optionSelected
    }
    
    private func loadUsers() {
        DataManager.shared.users(forceUpdate: false) { [weak self] result in
            self?.parseUsers(result: result)
        }
    }
    
    @objc func refreshUsers() {
        DataManager.shared.users(forceUpdate: true) { [weak self] result in
            self?.parseUsers(result: result)
            
        }
    }
    
    private func parseUsers(result: ServiceResult) {
        switch result {
        case .success(let data):
            guard let users = data as? Array<User> else {
                return
            }
            self.users = users
            updateTypeList(optionSelected: segmentOptions.selectedSegmentIndex)
            
        case .failure(let msg):
            print ("Fallo al obtener usuarios: \(msg)")
            
        }
        refreshControlTB.endRefreshing()
        refreshControlCV.endRefreshing()
    }
    
    
    private func updateTypeList(optionSelected: Int?) {
        switch optionSelected {
        case 0:
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
            
            
        default:
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
        
        }
    }
}


// MARK: - Extension TableView methods
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        
        // el register es para las celdas xib 
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        tableView.contentInset = topDistance(view: tableView)
        tableView.refreshControl = refreshControlTB
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        // esta función es para contar el numero de elementos
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "UserDetail", sender: indexPath)
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier, for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(image: user.avatar, name: user.name, email: user.email, birthdate: user.birthdate, nationality: user.nationality)
        }
        
        return cell
    }
}

// MARK: - Extension CollectionView methods
extension UsersViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Configure tableview with default options
    func configure(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: PersonCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PersonCollectionViewCell.cellIdentifier)
        collectionView.contentInset = topDistance(view: collectionView)
        collectionView.refreshControl = refreshControlCV
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    func topDistance(view: UIView) -> UIEdgeInsets {
        return UIEdgeInsets(top: (segmentOptions.frame.origin.y - collectionView.frame.origin.y) + segmentOptions.frame.size.height, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "UserDetail", sender: indexPath)
    } // esto sirve para pasar a la vista de detalles cuando no se puede seleccionar la celda.
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier, for: indexPath) as? PersonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(title: user.firstName, image: user.avatar)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - 16.0) / 2
        return CGSize(width: size, height: size)
    }
}



extension UsersViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UserDetailViewController,
            let indexPath = sender as? IndexPath else {
                return
        }

        destination.user = users[indexPath.row]
    }

}
