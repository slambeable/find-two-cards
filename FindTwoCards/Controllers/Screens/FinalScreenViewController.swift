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
    var resultLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        difficultButton.setTitle(isGameWin ? "Повысить сложность +15 сек" : "Понизить сложность -15 сек", for: .normal)
        labelResult()
        victories()
    }
    
    func labelResult() {
        resultLabel = isGameWin ? "Победа 😸" : "Поражение 😿"
        isGameResult.text = resultLabel
    }
    
    func victories() {
        if isGameWin {
            StorageManager.shared.winCounter += 1
        } else {
            StorageManager.shared.looseCounter += 1
        }
    }
}


