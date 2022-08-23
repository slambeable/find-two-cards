//
//  SettingsScreenViewController.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class SettingsScreenViewController: UIViewController {
    
    @IBOutlet var gameSegmentedControl: GameSegmentedControl!
    @IBOutlet var cardsButton: [CardViewController]!

    private let colorsForGradient = [
        [
            UIColor(red: 0.714, green: 1, blue: 0.765, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.714, blue: 0.989, alpha: 1).cgColor
        ],
        [
            UIColor(red: 0.69, green: 0.878, blue: 1, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.969, blue: 0.69, alpha: 1).cgColor
        ],
        [
            UIColor(red: 0.89, green: 1, blue: 0.584, alpha: 1).cgColor,
            UIColor(red: 0.682, green: 1, blue: 0.941, alpha: 1).cgColor
        ]
    ]
    
    private let difficult = ["60", "45", "30"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for (index, card) in cardsButton.enumerated() {
            card.setColor(colorsForGradient[index])
        }
        
        let indexForCardSelected = colorsForGradient.firstIndex(of: DataManager.shared.currentColorOfCard) ?? 0
        cardsButton[indexForCardSelected].selectCard()
        
        let indexForSegmentedControlSelected = difficult.firstIndex(of: DataManager.shared.currentDifficult.rawValue) ?? 0
        gameSegmentedControl.selectedSegmentIndex = indexForSegmentedControlSelected
    }
    
    @IBAction func changeGradientForCards(_ sender: CardViewController) {
        for card in cardsButton {
            card.unselectCard()
        }

        sender.selectCard()

        if let gradientColors = sender.gradientColors {
            DataManager.shared.currentColorOfCard = gradientColors
        }
    }

    @IBAction func changeDifficult(_ sender: GameSegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0: DataManager.shared.currentDifficult = .easy
        case 1: DataManager.shared.currentDifficult = .medium
        case 2: DataManager.shared.currentDifficult = .hard
        default:
            print("Error")
        }
        
    }
}
