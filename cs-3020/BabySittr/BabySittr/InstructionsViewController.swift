//
//  ViewController.swift
//  BabySittr
//
//  Created by Zach Larsen on 12/6/15.
//  Copyright © 2015 Zach Larsen. All rights reserved.
//

import UIKit

extension String {
    init(sep:String, _ lines:String...){
        self = ""
        for (idx, item) in lines.enumerate() {
            self += "\(item)"
            if idx < lines.count-1 {
                self += sep
            }
        }
    }
    
    init(_ lines:String...){
        self = ""
        for (idx, item) in lines.enumerate() {
            self += "\(item)"
            if idx < lines.count-1 {
                self += "\n"
            }
        }
    }
}

class InstructionsViewController: UIViewController {
    
    let screenSize = UIScreen.mainScreen().bounds
    
    let scrollView =  UIScrollView()
    var containerView = UITextView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(netHex:0xADD8E6)
        containerView.backgroundColor = UIColor(netHex:0xADD8E6)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        
        containerView.textColor = UIColor.whiteColor()
        containerView.font = UIFont.boldSystemFontOfSize(18.0)
        
        containerView.text = String(
        "Welcome to BabySittr!",
        "Thank you for choosing us for your Child's gameplay experience.",
        "All of the games we have to offer are designed with children as the highest priority.",
        "Please read through the instructions for gameplay tips.",
        " ",
        "To stop your child from leaving Babysittr just follow these instructions:",
        "1. Go to the Settings app on your device's home screen.",
        "2. Tap General.",
        "3. Tap Accessibility.",
        "4. Under the Learning section (scroll down if necessary), tap Guided Access.",
        "5. Toggle Guided Access to ON so that it shows green.",
        "6. Tap Passcode Settings.",
        "7. Tap Set Guided Access Passcode.",
        "8. Enter a four digit passcode. You will be prompted to enter it again.",
        "9. Tap Guided Access to return to the Guided Access settings.",
        "10. Toggle Accessibility Shortcut to green to have Guided Access appear as an option in the Accessibility Options menu when you triple-click",
        "your device's Home button.",
        "Once you have set that up successfully, just triple-click the home button inside BabySittr to lock your child from leaving the app.",
        " ",
        "Crashy Plane",
        " ",
        "This game is a classic fly around game. All you have to do is tap the screen to make your plane fly. If you don't feel like flying, that is fine too. Watch as your plane drives on the ground! You get a point for every mountain you pass.",
        " ",
        "Pig Town",
        " ",
        "Have you ever wanted to run your own pig farm? Here's your chance! In Pig Town you draw lines to guide the pigs to food, and then to the barn. When a pig is safe in the barn, your total score goes up!",
        " ",
        "Feed Me",
        " ",
        "It is up to you to feed the hungry alligator. He only likes pineapples, and the pineapple only grows connected to chains. Use your super strength and slice through the chains with your finger to feed the hungry alligator.",
        " ",
        "Save the Earth",
        " ",
        "Modeled after an arcade classic. Click the screen to shoot the aliens out of the sky. Once all the aliens are gone, you have saved the Earth from certain doom!",
        " ",
        "Tic-Tac-Toe",
        " ",
        "Classic game of Tic-Tac-Toe. Click any of the nine squares to make a move. The computer player will then think of a move and play as 'O'. Good luck!",
        " ",
        "Bakery Beat",
        " ",
        "As the owner of your very own bakery, you need to box up treats for your hungry guests. This can be done by dragging a treat to make a three in a row. Don't let all your delicious treats go to waste!",
        " ",
        "Ninja",
        " ",
        "We need your help! You are the last remaining ninja. Use your ninja stars by clicking on the screen. Quickly throw your weapons at the incoming monsters to save your friends!"
        )
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.frame = CGRect(x: 10, y: 0, width: screenSize.width-20, height: screenSize.height)
        containerView.frame = CGRect(x: 10, y: 0, width: screenSize.width-20, height: screenSize.height * 3.0)
        scrollView.contentSize = containerView.frame.size
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let newContentOffsetX = (self.screenSize.width/2) - (scrollView.bounds.size.width/2)
        scrollView.contentOffset = CGPointMake(newContentOffsetX, 0)

    }
    
    
}

