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
        setStylesForStartButtons()
    }

    private func setStylesForStartButtons() {
//        for button in startScreenButtons {
//            button.layer.cornerRadius = 12
//            button.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
//            button.layer.borderWidth = 2
//            
//            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//            button.layer.shadowOpacity = 1
//            button.layer.shadowOffset = CGSize(width: 0, height: 4)
//            button.layer.shadowRadius = 4
//        }
    }
}

