//
//  StartScreenViewController.swift
//  FindTwoCards
//
//  Created by Богдан Олейник on 01.03.2022.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    @IBAction func showPopUp() {
        let alertController = UIAlertController(
            title: "Разработчики",
            message: "Андрей Евдокимов \nБогдан Олейник",
            preferredStyle: .alert
        )
        
        let image = UIImage(named: "developers")
        alertController.addImage(image: image!)
        
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

