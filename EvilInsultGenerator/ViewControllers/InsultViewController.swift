//
//  ViewController.swift
//  EvilInsultGenerator
//
//  Created by Marat on 16.12.2020.
//

import UIKit

class InsultViewController: UIViewController {

    @IBOutlet var insultLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var notebookImageView: UIImageView!
    
    private var networkManager = NetworkManager.shared
        
    override func viewDidLoad() {
        super.viewDidLoad()
        insultLabel.isHidden = true
    }
    
    @IBAction func startButtonPassed(_ sender: UIButton) {
        networkManager.fetchData(
            from: "https://evilinsult.com/generate_insult.php?lang=en&type=json") { currentInsult in
            self.insultLabel.text = currentInsult.insult
        }
        
        sender.setTitle("Show more", for: .normal)
        
        if !notebookImageView.isHidden {
            notebookImageView.isHidden = true
        }
        
        if !titleLabel.isHidden {
            titleLabel.isHidden = true
        }
        
        if insultLabel.isHidden {
            insultLabel.isHidden = false
        }
        
    }
    
}
