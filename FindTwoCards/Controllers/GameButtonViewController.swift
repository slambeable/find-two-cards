//
//  GameButtonViewController.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class GameButtonViewController: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setStylesForStartButtons()
    }

    private func setStylesForStartButtons() {
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        self.layer.borderWidth = 2
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        
        self.layer.cornerRadius = 12
    }

}
