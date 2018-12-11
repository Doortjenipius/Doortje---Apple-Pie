//  ViewController.swift
//  Apple Pie
//  Created by doortje on 07/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.

import UIKit

// Class ViewController: Geeft basisfuncties van de game aan. Zoals welke woorden er gebruikt worden, hoeveel moves je mag maken en houdt de score bij. Daarnaast linkt hij alle views aan code.
class ViewController: UIViewController {
    
    // Lijst met woorden als string.
    var listOfWords: [String]! 
    
    // Aantal kansen die je hebt om een verkeerde letter te kiezen.
    let incorrectMovesAllowed = 7
    
    // totalWins slaat op hoe vaak iemand wint en start na elke overwinning een nieuwe ronde.
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    // totalLosses slaat op hoe vaak iemand verliest en start na elk verlies een nieuwe ronde.
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    // Outlets van de plaatjes, labels en buttons.
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!


    @IBAction func buttonTapped(_ sender: UIButton) {
        // een letterButton wordt disabled als er op geklikt is (hij wordt grijs).
        sender.isEnabled = false
        //Door ! geef je aan dat alle buttons een titel hebben en je lowercased alles zodat het makkelijker is om te vergelijken met elkaar.
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        // roept updateGameState aan.
        updateGameState()

    }
    
    // Checkt hoe vaak er nog een letter verkeerd mag worden raden, als dit getal 0 is en het woord is nog niet geraden telt totalLosses er 1 bij. Als het woord wel is geraden krijgt totalWins er 1 bij.
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    


// viewDidLoad start een nieuwe ronde 
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    var currentGame: Game!
    
    // newRound geeft aan hoe een nieuwe ronde in zijn werk gaat.
    func newRound() {
        // Checkt of de lijst met woorden niet leeg is.
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            // Nieuwe woord is een string. IncorrectMovesRemaing staat gelijk aan het aantal dat is opgeslagen in incorrectMovesAllowed. GuessedLetters slaat de geraden letters op.
            currentGame = Game(word: newWord as! String,
            incorrectMovesRemaining: incorrectMovesAllowed,
            guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
}
    // Enabled de letterButtons bij een nieuwe ronde.
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
// Update de interface van de app.
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        // Maakt het duidelijker hoeveel letters er moeten worden geraden. 
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

