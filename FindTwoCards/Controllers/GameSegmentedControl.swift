//
//  GameSegmentedControl.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class GameSegmentedControl: UISegmentedControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setGameStylesForGameSegmentedControl()
    }
    
    func setGameStylesForGameSegmentedControl() {
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.5).cgColor
        
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
    }

}
