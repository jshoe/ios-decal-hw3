//
//  Hangman.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import Foundation

class Hangman {
    var words: HangmanWords!
    var answer: String?
    var knownString: String?
    var guessedLetters: NSMutableArray?
    
    init() {
        words = HangmanWords()
    }
    
    func start() {
        print("Called start")
        let word = words.getRandomWord()
        print("New word is: " + word)
        answer = word
        knownString = ""
        for (var i = 0; i < answer!.characters.count; i += 1) {
            if (word as NSString).substringWithRange(NSMakeRange(i, 1)) == " " {
                knownString = knownString! + " "
            } else {
                knownString = knownString! + "_"
            }
        }
        guessedLetters = NSMutableArray()
        print("guessLetters: " + String(guessedLetters))
    }
    
    func guessLetter(letter: String) -> Bool {
        print("Hangman.swift guessLetter called")
        var result = false
        if guessedLetters!.containsObject(letter) {
            print("Letter was already guessed")
            return true
        }
        guessedLetters!.addObject(letter)
        var chars = Array(answer!.characters)
        
        for (var i = 0; i < answer!.characters.count; i += 1) {
            if String(chars[i]) == letter {
                result = true
                knownString = "\((knownString! as NSString).substringToIndex(i))" + "\(letter)"
                            + "\((knownString! as NSString).substringFromIndex(i+1))"
            }
            
        }
        print("Letter was in word: " + String(result))
        return result
    }
    
    func guesses() -> String {
        if guessedLetters!.count == 0 {
            return ""
        }
        var result: String = guessedLetters!.objectAtIndex(0) as! String
        for (var i = 0; i < guessedLetters!.count; i += 1) {
            result = result + ", \(guessedLetters?.objectAtIndex(i))"
        }
        print("Here are the guesses so far: " + result)
        return result
    }

}