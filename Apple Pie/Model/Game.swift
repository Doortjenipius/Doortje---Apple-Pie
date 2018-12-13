//
//  Game.swift
//  Apple Pie
//
//  Created by doortje on 07/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.
//

import Foundation
// Code van de game, hoe het spel werkt.

// Wanneer een letter niet in het woord zit, gaat er een appel van de boom.
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
// als een letters niet in het woord zit krijgt incorrectMovesRemaing -1.
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
// guessedword wordt aangevuld met de juiste letters.
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
} 
