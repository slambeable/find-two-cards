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
    
    func victories() {
        if isGameWin {
            StorageManager.shared.winCounter += 1
        } else {
            StorageManager.shared.looseCounter += 1
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func difficultButton(_ sender: Any) {
        buttonRaise()
    }
  
    func buttonRaise() {
        switch StorageManager.shared.currentDifficult {
        case .easy:
            if isGameWin {
                StorageManager.shared.currentDifficult = .medium
            } else {
                difficultButton.isEnabled = false
            }
        case .medium:
            if isGameWin {
                StorageManager.shared.currentDifficult = .hard
                difficultButton.isEnabled = false
            } else {
                StorageManager.shared.currentDifficult = .easy
                difficultButton.isEnabled = false
            }
        case .hard:
            if isGameWin {
                difficultButton.isEnabled = false
            } else {
                StorageManager.shared.currentDifficult = .medium
            }
        }
    }
    
    func buttonExaminationOne() {
        if isGameWin && StorageManager.shared.currentDifficult == .hard {
            difficultButton.isEnabled = false
        } else if !isGameWin && StorageManager.shared.currentDifficult == .easy {
            difficultButton.isEnabled = false
        }
    }
}

