//
//  ViewController.swift
//  Name Game
//
//  Created by Riad Hoque on 9/12/17.
//  Copyright © 2017 Riad Hoque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ nameField: UITextField) {
        let name = nameField.text
        
        lyricsView.text = lyricsForName(fullName: name!)
    }
    
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return false
    }
}

func shortName(name: String) -> String{
    var name = name
    name = name.lowercased()
    var temp = name
    var count = name.characters.count
    var first = temp.remove(at: temp.startIndex)
    if isVowel(char: first){
        return name
    }
    else {
        while count != 0{
            
            if isVowel(char: first){
                return String(first)+name
            } else {
                first = name.remove(at: name.startIndex)
                count = name.characters.count
            }
            
        }
    }
    
    return name
}

func isVowel(char: Character)->Bool{
    if (char == "a" || char == "e" || char == "i" || char == "o" || char == "u"){
        return true
    } else {
        return false
    }
    
}

func lyricsForName(fullName: String)->String{
    if fullName.characters.count==0{
        return ""
    }
    else{ return "\(fullName), \(fullName), Bo B\(shortName(name: fullName))\nBanana Fana Fo F\(shortName(name: fullName))\nMe My Mo M\(shortName(name: fullName))\n\(fullName)"}
}
