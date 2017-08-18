//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Eliz So on 6/8/2017.
//  Copyright © 2017 Eliz So. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winLabel: UILabel!
    
    @IBAction func Reset(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = true
        
        activeGame = true
        
        winLabel.text = " "
        
        
        for i in 1..<10{
            
            if let button = view.viewWithTag(i) as? UIButton{
                
                button.setImage(nil, for:[])
                
            }
            
        }
        
    }
    var activePlayer = true
    //true = nought, false = cross
    
    let winCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    //all the wining situation
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    //0 = empty, 1 = nought, 2 = cross
    
    var activeGame = true
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame == true{
            
            if (activePlayer == true){
                
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                
                activePlayer = false
                
                gameState[activePosition] = 1
                
            }else{
                
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                
                activePlayer = true
                
                gameState[activePosition] = 2
                
            }
            
            for combination in winCombination{
                
                
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{

                    
                    activeGame = false
                    
                    if gameState[combination[0]] == 1{
                        
                        winLabel.text = "Nought wins!"
                        
                        
                        
                    }else{
                        
                        winLabel.text = "Cross wins!"
                        
                        
                    
                    }
                    
                    
                    
                }
                
            }
            
           
        }else{
            
            print("This spot is not avaliable")
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winLabel.text = " "
        
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

