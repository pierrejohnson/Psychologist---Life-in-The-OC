//
//  TextViewController.swift
//  Psychologist
//
//  Created by AmenophisIII on 7/10/15.
//  Copyright (c) 2015 AmenophisIII. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{

    
    
    
    
    @IBOutlet weak var textView: UITextView! {
        
        didSet {
            textView.text = text
        }
    
    }

    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
    
    
    
    // allows us to override the resize for the history popover size
    override var preferredContentSize : CGSize {
        get {
            if textView != nil && presentingViewController != nil {
            return textView.sizeThatFits(presentingViewController!.view.bounds.size)
                
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
        
        
    }
    
}
