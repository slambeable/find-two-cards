//
//  ResultsScreenViewController.swift
//  FindTwoCards
//
//  Created by Богдан Олейник on 01.03.2022.
//

import UIKit

class ResultsScreenViewController: UIViewController {

    @IBOutlet weak var numberOfVictories: UILabel!
    @IBOutlet weak var numberOfDefeats: UILabel!
    
    private var victories = DataManager.shared.winCounter
    private var defeats = DataManager.shared.looseCounter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfVictories.text = "\(victories)"
        numberOfDefeats.text = "\(defeats)"
    }
    

    @IBAction func shareButton(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [victories, defeats], applicationActivities: nil)
        
        present(shareController, animated: true, completion: nil)
    }
}
