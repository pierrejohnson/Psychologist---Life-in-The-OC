//
//  ViewController.swift
//  Psychologist
//
//  Created by AmenophisIII on 7/9/15.
//  Copyright (c) 2015 AmenophisIII. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    
    
    // example of a segue via code / identifier
    @IBAction func nothing(sender: AnyObject) {
        performSegueWithIdentifier("nothing", sender: nil)
        
    }
    
    
    
    
    // we override the prepareforSegue to change the UI
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController as? UIViewController // (because we know it's a UIViewController of some sort)
        
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        
        // this lets us make sure we segue towards the RIGHT place we're going to (we could be going for a segue into a different controller
        if let hvc = /*segue.destinationViewController*/ destination as? HappinessViewController {
            
            if let identifier = segue.identifier {
                
                switch identifier {
                    case "ecstatic":
                        hvc.happiness = 100
                
                    case "Meh":
                        hvc.happiness = 49
                    
                    case "Happy":
                        hvc.happiness = 70
                    
                    case "nothing":
                        hvc.happiness = 15
                    
                    default:
                        hvc.happiness = 10
                }
                
            }
            
            
            
        }
    }

}

