//
//  ViewController.swift
//  20SwipDirections
//
//  Created by Javier Gomez on 12/7/15.
//  Copyright © 2015 Javier Gomez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var backgroundColor: UIImageView!
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["explosion2", "explosion", "car", "window", "magia", "door"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.Right:
                backgroundColor.backgroundColor = UIColor.blackColor()
            case UISwipeGestureRecognizerDirection.Down:
                backgroundColor.backgroundColor = UIColor.blueColor()
            case UISwipeGestureRecognizerDirection.Left:
                backgroundColor.backgroundColor = UIColor.brownColor()
            case UISwipeGestureRecognizerDirection.Up:
                backgroundColor.backgroundColor = UIColor.redColor()
            default:
                break
            }
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        
        if event?.subtype == UIEventSubtype.MotionShake
        {
            
            var randomSounds = Int(arc4random_uniform(UInt32(sounds.count)))
            
            backgroundColor.backgroundColor = UIColor.yellowColor()
            
           
            var fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomSounds], ofType: "mp3")
            
            do
            {
            try
                player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
            
                player.play()
            }
            catch
            {
                //do anything
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

