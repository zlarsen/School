//
//  MainMenuController.swift
//  BabySittr
//
//  Created by Zach Larsen on 12/7/15.
//  Copyright © 2015 Zach Larsen. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class MainMenuController: UIViewController, UIScrollViewDelegate {
    
    let screenSize = UIScreen.mainScreen().bounds

    let scrollView =  UIScrollView()
    var containerView = UIView()
    
    let button1 = UIButton(type: .System)
    let button2 = UIButton(type: .System)
    let button3 = UIButton(type: .System)
    let button4 = UIButton(type: .System)
    let button5 = UIButton(type: .System)
    let button6 = UIButton(type: .System)
    let button7 = UIButton(type: .System)
    let button8 = UIButton(type: .System)
    let numButtons = 8
    let buttonHeight: CGFloat = 85

    let mainColor = UIColor(netHex:0xADD8E6)
    let secondaryColor = UIColor.whiteColor()
    let tertiaryColor = UIColor(netHex:0xADD8E6)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(netHex:0xADD8E6)
        containerView.backgroundColor = UIColor(netHex:0xADD8E6)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: Selector("buttonAction1"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button1)
        button1.backgroundColor = UIColor(patternImage: UIImage(named: "instructions.png")!)
//        button1.setTitle("Game 1", forState: .Normal)
        
//        button1.setTitleColor(secondaryColor, forState: .Normal)
//        button1.titleLabel!.font = UIFont.systemFontOfSize(18)

        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: Selector("buttonAction2"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button2)
        button2.backgroundColor = UIColor(patternImage: UIImage(named: "crashyPlane.png")!)
//        button2.backgroundColor = mainColor
//        button2.setTitle("Game 2", forState: .Normal)
//        button2.setTitleColor(secondaryColor, forState: .Normal)
//        button2.titleLabel!.font = UIFont.systemFontOfSize(18)
        
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: Selector("buttonAction3"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button3)
        button3.backgroundColor = UIColor(patternImage: UIImage(named: "PigTown.png")!)
//        button3.backgroundColor = mainColor
//        button3.setTitle("Game 3", forState: .Normal)
//        button3.setTitleColor(secondaryColor, forState: .Normal)
//        button3.titleLabel!.font = UIFont.systemFontOfSize(18)
        
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.addTarget(self, action: Selector("buttonAction4"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button4)
        button4.backgroundColor = UIColor(patternImage: UIImage(named: "feedMe.png")!)
        
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.addTarget(self, action: Selector("buttonAction5"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button5)
        button5.backgroundColor = UIColor(patternImage: UIImage(named: "saveTheEarth.png")!)
        
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.addTarget(self, action: Selector("buttonAction6"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button6)
        button6.backgroundColor = UIColor(patternImage: UIImage(named: "tic-tac-toe.png")!)

        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.addTarget(self, action: Selector("buttonAction7"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button7)
        button7.backgroundColor = UIColor(patternImage: UIImage(named: "BakeryBeat.png")!)

        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.addTarget(self, action: Selector("buttonAction8"), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button8)
        button8.backgroundColor = UIColor(patternImage: UIImage(named: "Ninja.png")!)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        containerView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 1.25)
        scrollView.contentSize = containerView.frame.size
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor(red: 0.0, green: 0.3, blue: 0.5, alpha: 0.3)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        //top button1
        containerView.addConstraint(NSLayoutConstraint(
            item: button1,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .Top,
            multiplier: 1,
            constant: 60))
        
        //leading button1
        containerView.addConstraint(NSLayoutConstraint(
            item: button1,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 8))
        
        //trailing button1
        containerView.addConstraint(NSLayoutConstraint(
            item: button1,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: -8))
        
        //button height button1
        button1.addConstraint(NSLayoutConstraint(
            item: button1,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button2
        view.addConstraint(NSLayoutConstraint(
            item: button2,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button1,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button2
        view.addConstraint(NSLayoutConstraint(
            item: button2,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button2
        view.addConstraint(NSLayoutConstraint(
            item: button2,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button2
        button2.addConstraint(NSLayoutConstraint(
            item: button2,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button3
        view.addConstraint(NSLayoutConstraint(
            item: button3,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button2,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button3
        view.addConstraint(NSLayoutConstraint(
            item: button3,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button3
        view.addConstraint(NSLayoutConstraint(
            item: button3,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button3
        button3.addConstraint(NSLayoutConstraint(
            item: button3,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button4
        view.addConstraint(NSLayoutConstraint(
            item: button4,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button3,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button4
        view.addConstraint(NSLayoutConstraint(
            item: button4,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button4
        view.addConstraint(NSLayoutConstraint(
            item: button4,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button4
        button4.addConstraint(NSLayoutConstraint(
            item: button4,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button5
        view.addConstraint(NSLayoutConstraint(
            item: button5,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button4,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button5
        view.addConstraint(NSLayoutConstraint(
            item: button5,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button5
        view.addConstraint(NSLayoutConstraint(
            item: button5,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button5
        button5.addConstraint(NSLayoutConstraint(
            item: button5,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button6
        view.addConstraint(NSLayoutConstraint(
            item: button6,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button5,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button6
        view.addConstraint(NSLayoutConstraint(
            item: button6,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button6
        view.addConstraint(NSLayoutConstraint(
            item: button6,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button6
        button6.addConstraint(NSLayoutConstraint(
            item: button6,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button7
        view.addConstraint(NSLayoutConstraint(
            item: button7,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button6,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button7
        view.addConstraint(NSLayoutConstraint(
            item: button7,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button7
        view.addConstraint(NSLayoutConstraint(
            item: button7,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button7
        button7.addConstraint(NSLayoutConstraint(
            item: button7,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
        
        //top button8
        view.addConstraint(NSLayoutConstraint(
            item: button8,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.button7,
            attribute: .Bottom,
            multiplier: 1,
            constant: 10))
        
        //leading button8
        view.addConstraint(NSLayoutConstraint(
            item: button8,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing button8
        view.addConstraint(NSLayoutConstraint(
            item: button8,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height button8
        button8.addConstraint(NSLayoutConstraint(
            item: button8,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: buttonHeight))
    }
    
    func buttonAction1()
    {
        performSegueWithIdentifier("Instructions", sender: nil)
    }
    
    func buttonAction2()
    {
        performSegueWithIdentifier("CrashyPlane", sender: nil)
    }
    
    func buttonAction3()
    {
        performSegueWithIdentifier("PigTown", sender: nil)
    }
    
    func buttonAction4()
    {
        performSegueWithIdentifier("FeedMe", sender: nil)
    }
    func buttonAction5()
    {
        performSegueWithIdentifier("GameThree", sender: nil)
    }
    func buttonAction6()
    {
        performSegueWithIdentifier("TicTacToe", sender: nil)
    }
    func buttonAction7()
    {
        performSegueWithIdentifier("GameThree", sender: nil)
    }
    func buttonAction8()
    {
        performSegueWithIdentifier("Ninja", sender: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        self.scrollView.setContentOffset(CGPointMake(0, self.scrollView.contentOffset.y), animated: true
        if scrollView.contentOffset.x>0 || scrollView.contentOffset.x<0{
            scrollView.contentOffset.x = 0
        }
        self.scrollView.directionalLockEnabled = true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.scrollEnabled = true
//        scrollView.frame = view.bounds
//        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
//    }
}