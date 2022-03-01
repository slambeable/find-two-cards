//
//  UISegmentedControl+Style.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

extension UISegmentedControl {

    func setGameStyle() {
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        self.layer.borderWidth = 2
    }

}
