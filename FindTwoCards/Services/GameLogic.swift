//
//  GameLogic.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import Foundation

class GameLogic {
    var chooseCardCounter = 0
    var counterOfFindPairs = 0
    var chosenCards: [Card] = []
    
    var cards: [Card] = []

    func initGame(emojis: [String]) {
        var cards: [Card] = []

        for (index, emoji) in emojis.enumerated() {
            let card1 = Card(emoji: emoji, pairId: index)
            let card2 = Card(emoji: emoji, pairId: index)
            
            cards += [card1, card2]
        }
        
        self.cards = cards.shuffled()
    }
    
    func nextStep(_ indexOfCard: Int) {
        switch chooseCardCounter {
        case 0:
            chosenCards.append(cards[indexOfCard])
            cards[indexOfCard].isFacedUp = true 
            chooseCardCounter += 1
        case 1:
            if !(chosenCards.first === cards[indexOfCard]) {
                if let chosenCardId = chosenCards.first?.pairId {
                    if chosenCardId == cards[indexOfCard].pairId {
                        counterOfFindPairs += 2
                        cards[indexOfCard].isMatched = true
                        chosenCards.first?.isMatched = true
                        chosenCards = []
                        chooseCardCounter = 0
                    } else {
                        chosenCards.append(cards[indexOfCard])
                        cards[indexOfCard].isFacedUp = true
                        chooseCardCounter += 1
                    }
                }
            }
        case 2:
            for chosenCard in chosenCards {
                chosenCard.isFacedUp = false
            }
            chosenCards = []
            chosenCards.append(cards[indexOfCard])
            cards[indexOfCard].isFacedUp = true
            chooseCardCounter = 1
        default:
            print("Error")
        }
    }
}
