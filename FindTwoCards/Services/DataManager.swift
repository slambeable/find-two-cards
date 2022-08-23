//
//  DataManager.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//
import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var winCounter = 0
    var looseCounter = 0
    
    var currentDifficult: DifficultSettings = .easy
    
    var currentColorOfCard: [CGColor] = [
        UIColor(red: 0.714, green: 1, blue: 0.765, alpha: 1).cgColor,
        UIColor(red: 1, green: 0.714, blue: 0.989, alpha: 1).cgColor
    ]
    
    func getEmojiForCards() -> [String] {
        ["🐦", "🐷", "🐮", "🐸", "🦊", "🐶"]
    }
    
    private init () {}
}

extension DataManager {
    enum DifficultSettings: String {
        case easy = "60"
        case medium = "45"
        case hard = "30"
    }
}
