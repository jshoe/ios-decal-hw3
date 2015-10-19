//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet var newGameButton: UIBarButtonItem!
    @IBOutlet var guessField: UITextField!
    @IBOutlet var guessLabel: UILabel!
    var HangmanState = Hangman()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        newGame()
        print("Loading view")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func newGame() {
        HangmanState.start()
        guessLabel.text = ""
    }
    
    func loadInterface() {
        newGameButton.action = "newGame"
        print("Set interface button")
    }
    
    func refresh() {
        guessLabel.text = HangmanState.guesses()
    }
    
    @IBAction func guessLetter(sender: UIButton) {
        print("guessLetter called")
        HangmanState.guessLetter(guessField.text!)
        self.view.endEditing(true)
        guessField.text = ""
        refresh()
    }
}