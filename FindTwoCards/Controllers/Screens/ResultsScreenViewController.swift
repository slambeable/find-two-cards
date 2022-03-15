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
    
    var victories = StorageManager.shared.winCounter / 12
    var defeats = StorageManager.shared.looseCounter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfVictories.text = "\(victories)"
        numberOfDefeats.text = "\(defeats)"
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
