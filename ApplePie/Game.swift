//
//  Game.swift
//  ApplePie
//
//  Created by Anish  on 02/09/25.
//
struct Game {
    var word: String
    var incorrectMovesRemaing: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaing -= 1
        }
        
    }
    
    var formattedWord: String {
        var guessedWord: String = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "-"
            }
        }
        return guessedWord
    }
}

