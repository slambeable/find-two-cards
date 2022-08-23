//
//  FinalScreenViewController.swift
//  FindTwoCards
//
//  Created by Богдан Олейник on 01.03.2022.
//

import UIKit

class FinalScreenViewController: UIViewController {
    
    @IBOutlet var isGameResult: UILabel!
    @IBOutlet var difficultButton: GameButton!
    
    var isGameWin: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        difficultButton.setTitle(isGameWin ? "Повысить сложность -15 сек" : "Понизить сложность +15 сек", for: .normal)
        isGameResult.text = isGameWin ? "Победа 😸" : "Поражение 😿"
        buttonExaminationOne()
        victories()
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    @IBAction func difficultButton(_ sender: Any) {
        switch DataManager.shared.currentDifficult {
        case .easy:
            if isGameWin {
                DataManager.shared.currentDifficult = .medium
            } else {
                difficultButton.isEnabled = false
            }
        case .medium:
            if isGameWin {
                DataManager.shared.currentDifficult = .hard
                difficultButton.isEnabled = false
            } else {
                DataManager.shared.currentDifficult = .easy
                difficultButton.isEnabled = false
            }
        case .hard:
            if isGameWin {
                difficultButton.isEnabled = false
            } else {
                DataManager.shared.currentDifficult = .medium
            }
        }
    }
    
    private func victories() {
        if isGameWin {
            DataManager.shared.winCounter += 1
        } else {
            DataManager.shared.looseCounter += 1
        }
    }
    
    private func buttonExaminationOne() {
        if isGameWin && DataManager.shared.currentDifficult == .hard {
            difficultButton.isEnabled = false
        } else if !isGameWin && DataManager.shared.currentDifficult == .easy {
            difficultButton.isEnabled = false
        }
    }
}

