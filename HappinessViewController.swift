//
//  HappinessViewController.swift
//  Happiness
//
//  Created by AmenophisIII on 7/7/15.
//  Copyright (c) 2015 AmenophisIII. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:")) // setting up gesture in code - other way is in the storyboard
        }
        
    }
    
    
    //the MODEL
    var happiness : Int = 99 { // 0 is sad, 100 is ecstatic
        didSet {
            happiness = min(max(0, happiness), 100)
            UpdateUI()
        }
    
    }
    
    private struct Constants {
        static let happinessGestureScale :CGFloat = 4
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state{
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = Int(translation.y / Constants.happinessGestureScale)
        
            if happinessChange != 0 {
            happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:
            break
        
    }
    }
  private func UpdateUI()
    {
        faceView?.setNeedsDisplay() // setting it as an optional allows us to forego the need for the outlets to be set before we mess with it
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        // interprets the view for the model and the model for the view
        return Double (happiness-50)/50
    }
  
}
