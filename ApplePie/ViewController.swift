//
//  ViewController.swift
//  ApplePie
//
//  Created by Anish  on 01/09/25.
//

import UIKit

var listOfWords = ["buccaneer", "swift", "glorius", "incandescent", "bug", "program"]

let incorrectMovesAllowed: Int = 6

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func letterButtonAction(_ sender: UIButton) {
        sender.isEnabled = false
    }
}

