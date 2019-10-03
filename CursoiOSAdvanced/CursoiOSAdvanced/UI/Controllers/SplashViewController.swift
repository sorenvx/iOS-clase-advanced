//
//  SplashViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // esto gestiona los hilos de la app, esto ejecuta el codigo despues de x tiempo
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewControllerDestination = storyboard.instantiateInitialViewController() else {
                return
            }
            
            self.present(viewControllerDestination, animated: true)
        }
        
    }
}
