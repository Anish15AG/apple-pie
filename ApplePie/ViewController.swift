//
//  ViewController.swift
//  ApplePie
//
//  Created by Anish  on 01/09/25.
//

import UIKit

var listOfWords = ["buccaneer", "swift", "glorius", "incandescent", "bug", "program"]

let incorrectMovesAllowed: Int = 7


class ViewController: UIViewController {
    
    //using didSet to check whether new value has been updated in the property
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }

    var totalLosses = 0 {
        didSet{
            newRound()
        }
    }

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    //During a brief instance while app launches there wont be any value and to avoid the error and will cover the value in future
    var currentGame: Game!
    
     func newRound() {
         if !listOfWords.isEmpty {
             let newWord = listOfWords.removeFirst()
             
             currentGame = Game(word: newWord, incorrectMovesRemaing: incorrectMovesAllowed, guessedLetters: [])
             enableLetterButtons(true)
             updateUI()
         } else {
             enableLetterButtons(false)
         }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        //Initialization of immutable value 'wordWithSpacing' was never used; consider replacing with assignment to '_' or removing it
        correctWordLabel.text = currentGame.formattedWord
        
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaing)")
    }

    @IBAction func letterButtonAction(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
//        updateUI() //to updateUI everytime button is pressed
        updateGameState()
 
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaing == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
}

