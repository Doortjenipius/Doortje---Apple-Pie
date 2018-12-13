//
//  IntroPage.swift
//  Apple Pie
//
//  Created by doortje on 23/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.
//

import UIKit

class IntroPageViewController: UIViewController {
    
    @IBAction func unwindToIntro(segue: UIStoryboardSegue){
    }

    // Lijst met woorden als string. 
    var listOfWords: [String]!
    
    // Button 'simple'. Als er op de button wordt gedrukt wordt het spel gestart met de woorden die in de lijst listOfWords staan. Deze worden doorgegevn doormiddel van de Segue.
    @IBAction func simple(_ sender: Any) {
        listOfWords = ["dog", "farm", "apple", "skirt", "goat", "nice","mom"]
        performSegue(withIdentifier: "applepage", sender: sender)
    }
    
    // Button 'medium'. Als er op de button wordt gedrukt wordt het spel gestart met de woorden die in de lijst listOfWords staan. Deze worden doorgegevn doormiddel van de Segue.
    @IBAction func medium(_ sender: Any) {
        listOfWords = ["table", "story", "soccer", "chairs", "picnic", "spider", "bagpack","milkshake"]
        performSegue(withIdentifier: "applepage", sender: sender)
    }
    
    // Button 'hard'. Als er op de button wordt gedrukt wordt het spel gestart met de woorden die in de lijst listOfWords staan. Deze worden doorgegevn doormiddel van de Segue.
    @IBAction func hard(_ sender: Any) {
        listOfWords = ["bitcoin", "applepie", "bookstore", "magazine", "pineapples", "apartment", "hamburger"]
        performSegue(withIdentifier: "applepage", sender: sender)
    }
    
    
    // de correcte listOfWords wordt doorgegeven naar ViewController.
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "applepage" {
            let words = segue.destination as! ViewController
            words.listOfWords = listOfWords
        }
        
    }
    
    
    // Outlets van de 3 buttons zodat deze kunnen worden ge-edit.
    @IBOutlet weak var simple_button: UIButton!
    @IBOutlet weak var middle_button: UIButton!
    @IBOutlet weak var hard_button: UIButton!
    
    // Outlet van het Label zodat deze kan worden ge-edit.
    @IBOutlet weak var play: UILabel!
    
    // View wordt geladen met de juiste gegevens voor de interface.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Radius van de buttons
        simple_button.layer.cornerRadius = 8
        middle_button.layer.cornerRadius = 8
        hard_button.layer.cornerRadius = 8

        // Background image code
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "apple.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

