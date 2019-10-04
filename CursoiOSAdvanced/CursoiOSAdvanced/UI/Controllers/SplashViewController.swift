//
//  SplashViewController.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var mviewLoading: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAnimation()
        navigate()
    }
    
    func playAnimation(){
        let animationView = AnimationView(name: "social")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.frame = mviewLoading.bounds
        mviewLoading.addSubview(animationView)
        animationView.play()
    }
    
    private func navigate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // esto gestiona los hilos de la app, esto ejecuta el codigo despues de x tiempo
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewControllerDestination = storyboard.instantiateInitialViewController() else {
                return
            }
            
            self.present(viewControllerDestination, animated: true)
        }
    }
}
