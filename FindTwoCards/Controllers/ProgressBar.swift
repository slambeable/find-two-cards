//
//  TimerProgress.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

import UIKit

class ProgressBar: UIProgressView {

    var timer: Timer?
    var runCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func startTimer(with secondForRound: Int, selector: @escaping (Bool) -> Void ) {
        runCount = secondForRound

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(fireTimer),
            userInfo: selector,
            repeats: true
        )
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    @objc private func fireTimer(target: Timer) {
        guard let userInfo = target.userInfo as? (Bool) -> Void else { return }

        runCount -= 1
        userInfo(false)
        
        if (runCount == -1) {
            timer?.invalidate()
            userInfo(true)
        }
    }
    
    private func setStyle() {
        guard let superview = superview else { return }
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor

        superview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        superview.layer.shadowOpacity = 1
        superview.layer.shadowOffset = CGSize(width: 0, height: 4)
        superview.layer.shadowRadius = 4
        superview.layer.cornerRadius = 14

        layer.masksToBounds = true
        
        layer.cornerRadius = 14
    }
}
