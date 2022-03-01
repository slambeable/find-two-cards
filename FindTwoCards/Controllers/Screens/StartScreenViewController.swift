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
        // Тут вызов попапа
    }
}

