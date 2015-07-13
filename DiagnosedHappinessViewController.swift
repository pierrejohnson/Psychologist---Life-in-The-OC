//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by AmenophisIII on 7/10/15.
//  Copyright (c) 2015 AmenophisIII. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController, UIPopoverPresentationControllerDelegate
{
   
    
    // adding a property observer to an overridden var from a subclass is a good way to keep monitoring and update on changes....
    override var happiness:Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    // keeping track of the diagnosis...or not. 
    // a good place to store the # is to use NSUserDefaults
   // var diagnosticHistory = [Int] ()
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory: [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
        defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    // HAS TO MATCH with actual Segue - else we will get nothing
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // we want to prepare 
        
        // (1) make sure this is the right segway
        
        if let identifier = segue.identifier {
            switch identifier {
                case History.SegueIdentifier:
                    if let tvc = segue.destinationViewController as? TextViewController {
                        
                        if let ppc = tvc.popoverPresentationController
                        {
                            // this returns nil when we are not in a popover presentation
                            ppc.delegate = self  // this enables someone else to control it
                        }
                        tvc.text = "\(diagnosticHistory)"
                }
            default:break
            }
            
            
        }
        
    }
    
    
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.None    // If we're on iPhone, Do NOT adapt as Modal...
    }
    
    
}
