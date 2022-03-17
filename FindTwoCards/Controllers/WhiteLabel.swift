//
//  WhiteLabel.swift
//  FindTwoCards
//
//  Created by Олейник Богдан on 17.03.2022.
//

import UIKit

class WhiteLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStylesForLabels()
    }
    
    private func setStylesForLabels() {
        
        let shadows = UILabel()
        
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.bounds = shadows.bounds
        layer.position = shadows.center
        
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
