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
        switch sender.selectedSegmentIndex {
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
    
    private var cellSpacing: CGFloat = 16.0
    private var users: Array<User> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // segmentOptions.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        
        configure(tableView: tableView)
        configure(collectionView: collectionView)
        loadUsers()
        
    }
    
    
    private func loadUsers() {
        DataManager.shared.users() { [weak self] result in
            switch result {
            case .success(let data):
                guard let users = data as? Array<User> else {
                    return
                }
                self?.users = users
                
                switch self?.segmentOptions.selectedSegmentIndex {
                case 0:
                    self?.tableView.reloadData()
                    
                default:
                    self?.collectionView.reloadData()
                }
                
            case .failure(let msg):
                print ("Fallo al obtener usuarios: \(msg)")
            }
        }
    }
}



// MARK: - Extension TableView methods
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Configure tableview with default options
    func configure(tableView: UITableView) {
        
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        tableView.contentInset = UIEdgeInsets(top: segmentOptions.frame.origin.y, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        // esta función es para contar el numero de elementos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexpath te dice la posición (numero de sección, y numero de fila)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier, for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(image: user.avatar, name: user.name, email: user.email)
        }
        return cell
    }
}
 
// MARK: - Extension CollectionView methods
extension UsersViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Configure tableview with default options
    func configure(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: PersonCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PersonCollectionViewCell.cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: segmentOptions.frame.origin.y + segmentOptions.bounds.height, left: 0, bottom: 0, right: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
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
