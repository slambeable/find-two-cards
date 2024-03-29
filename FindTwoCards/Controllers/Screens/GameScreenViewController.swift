//
//  GameScreenViewController.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class GameScreenViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressBarView: ProgressBar!
    @IBOutlet var cardButtons: [CardViewController]!
    
    private let gameLogic = GameLogic()
    private let secondForRound = DataManager.shared.currentDifficult.rawValue
    
    private var isGameWin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emojis = DataManager.shared.getEmojiForCards()
        gameLogic.initGame(emojis: emojis)
        
        for (index, cardButton) in cardButtons.enumerated() {
            cardButton.setParametersForCard(with: gameLogic.cards[index])
        }
        
        timeLabel.text = secondForRound

        progressBarView.startTimer(with: Int(secondForRound) ?? 60, selector: fireTimer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let currentColor = DataManager.shared.currentColorOfCard
        
        for card in cardButtons {
            card.setColor(currentColor)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let finalScreen = segue.destination as? FinalScreenViewController else { return }
        
        finalScreen.isGameWin = isGameWin
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func fireTimer(_ isEnd: Bool) {
        if !isEnd {
            timeLabel.text = progressBarView.runCount >= 0 ? String(progressBarView.runCount) : "0"
            
            progressBarView.progress = Float(progressBarView.runCount) / (Float(secondForRound) ?? 60)

            UIView.animate(
                withDuration: 1,
                delay: 0,
                options: [.curveLinear, .beginFromCurrentState, .preferredFramesPerSecond60],
                animations: { self.progressBarView.layoutIfNeeded() })
            
            if (progressBarView.runCount == 15) {
                progressBarView.tintColor = .red
            }
        } else {
            isGameWin = false
            performSegue(withIdentifier: "final", sender: nil)
        }
    }

    @IBAction func chooseCard(_ sender: CardViewController) {
        guard let indexOfCard = cardButtons.firstIndex(of: sender) else { return }
        gameLogic.nextStep(indexOfCard)
        
        for index in cardButtons.indices {
            let card = gameLogic.cards[index]
            let button = cardButtons[index]
            
            if card.isFacedUp {
                button.setTitle(card.emoji, for: .normal)
            } else {
                button.setTitle("🔶", for: .normal)
            }
            
            if card.isMatched {
                button.layer.opacity = 0
                button.isUserInteractionEnabled = false
            }
        }
        
        if gameLogic.counterOfFindPairs == gameLogic.cards.count {
            progressBarView.stopTimer()
            isGameWin = true
            performSegue(withIdentifier: "final", sender: nil)
        }
    }
}
