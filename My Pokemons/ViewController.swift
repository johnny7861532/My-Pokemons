//
//  ViewController.swift
//  My Pokemons
//
//  Created by Johnny Hsieh on 2016/10/4.
//  Copyright © 2016年 PixelMonkey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var typePokemonsname: UITextField!
    @IBOutlet weak var pokemonsImage: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonball: UIButton!
    
    var mPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonsImage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapDidShowPokemons(_ sender: AnyObject) {
        
        switch self.typePokemonsname.text! {
           
        case"pikachu":
            playsound(sound: "found")
            pokemon(name: "\(self.typePokemonsname.text!)")

        case"caterpie":
            playsound(sound: "found")
             pokemon(name: "\(self.typePokemonsname.text!)")
            
        case "ekans":
            playsound(sound: "found")
             pokemon(name: "\(self.typePokemonsname.text!)")
            case "clefairy":
            playsound(sound: "found")
            pokemon(name: "\(self.typePokemonsname.text!)")

        case "":
            let alert = UIAlertController(title: "Error", message: "Pokemons name can't be empty!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        default:
            playsound(sound: "not_found")
            self.pokemonLabel.text = "Sorry! you miss up \(self.typePokemonsname.text!) :'( "
            self.pokemonsImage.isHidden = true
            self.pokemonLabel.isHidden = false
            
        }
        self.typePokemonsname.text = ""
       
        
    
    }
    func textFieldShouldReturn(textFiled: UITextField) ->Bool{
        textFiled.resignFirstResponder()
        return true
    }
    func playsound(sound: String){
        let url = Bundle.main.path(forResource: sound, ofType: "wav")!
        do{
            try mPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            mPlayer?.stop()
            mPlayer?.currentTime = 0.0
            mPlayer?.play()
            
        
        
        }catch let error as NSError{
        
        print(error.localizedDescription)
        
        }
    
    
    }
    func pokemon(name: String){
        self.pokemonsImage.image = UIImage(named:name)
        self.pokemonLabel.text = name
        self.pokemonsImage.isHidden = false
        self.pokemonLabel.isHidden = false
        self.pokemonball.isHidden = true
        UIView.animate(withDuration: 2, delay:4, options:UIViewAnimationOptions.transitionCurlDown, animations: {
            self.pokemonsImage.alpha = 0
            }, completion: {  finished in
                self.pokemonsImage.isHidden = true
                self.pokemonsImage.alpha = 1
                self.pokemonLabel.isHidden = true
                self.pokemonball.isHidden  = false
                
        })
       
    }
   
}

