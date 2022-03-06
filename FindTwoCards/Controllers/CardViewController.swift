//
//  CardViewController.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class CardViewController: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var gradientColors: [CGColor]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadow()
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        
        layer.cornerRadius = 12
        
        layer.borderWidth = 3
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
    }


    func setColor(_ colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.cornerRadius = 12
        gradientLayer.frame = bounds

        backgroundColor = UIColor.clear
        layer.insertSublayer(gradientLayer, at: 0)
        
        gradientColors = gradientLayer.colors as? [CGColor]
    }
    
    func selectCard() {
        layer.borderColor = UIColor(ciColor: .blue).withAlphaComponent(0.5).cgColor
    }

    func unselectCard() {
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
    }
}
