//
//  StartScreenViewController.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet var startScreenButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func showPopUp() {
            let alertController = UIAlertController(
                title: "Разработчики",
                message: "Андрей Евдокимов \nБогдан Олейник",
                preferredStyle: .alert)
        
            let image = UIImage(named: "developers")
        alertController.addImage(image: image!)
        
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        }
}

