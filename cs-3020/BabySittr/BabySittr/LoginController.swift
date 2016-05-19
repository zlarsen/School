//
//  LoginController.swift
//  BabySittr
//
//  Created by Zach Larsen on 12/6/15.
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

class LoginController: UIViewController {
    
    let button = UIButton(type: .System)
    let forgot = UILabel()
    let textFields = UIView()
    let password = UITextField()
    let email = UITextField()
    let branding = UIView()
    let brandingImage = UIImageView()
    
    let mainColor = UIColor(netHex:0xADD8E6)
    let secondaryColor = UIColor.whiteColor()
    let tertiaryColor = UIColor(netHex:0xADD8E6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()

        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: Selector("buttonAction"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        button.backgroundColor = mainColor
        button.setTitle("Join BabySittr", forState: .Normal)
        button.setTitleColor(secondaryColor, forState: .Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(18)
        
        forgot.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgot)
        forgot.text = "Forgot your password?"
        forgot.textColor = tertiaryColor
        
        textFields.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFields)
        textFields.backgroundColor = tertiaryColor
        
        password.translatesAutoresizingMaskIntoConstraints = false
        textFields.addSubview(password)
        password.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor(netHex:0xADD8E6)])
        password.backgroundColor = secondaryColor
        
        email.translatesAutoresizingMaskIntoConstraints = false
        textFields.addSubview(email)
        email.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor(netHex:0xADD8E6)])
        email.backgroundColor = secondaryColor
        
        branding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(branding)
//        branding.backgroundColor = mainColor
        branding.backgroundColor = UIColor(patternImage: UIImage(named: "kids-play-ftr.jpg")!)
        
        
        brandingImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brandingImage)
        brandingImage.backgroundColor = tertiaryColor
//        brandingImage.backgroundColor = UIColor(patternImage: UIImage(named: "kids-play-ftr.jpg")!)

    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        //bottom
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .BottomMargin,
            multiplier: 1,
            constant: -10))
        
        //leading
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        //button height
        button.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 50))
        
        
        //bottom
        view.addConstraint(NSLayoutConstraint(
            item: forgot,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: button,
            attribute: .Top,
            multiplier: 1,
            constant: -20))
        
        //CenterX
        view.addConstraint(NSLayoutConstraint(
            item: forgot,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0))
        
        //bottom
        view.addConstraint(NSLayoutConstraint(
            item: textFields,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: forgot,
            attribute: .Top,
            multiplier: 1,
            constant: -20))
        
        //leading
        view.addConstraint(NSLayoutConstraint(
            item: textFields,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0))
        
        //trailing
        view.addConstraint(NSLayoutConstraint(
            item: textFields,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0))
        
        let textFieldSpace: CGFloat = 1
        let textFieldHeight: CGFloat = 50
        
        //bottom
        textFields.addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Bottom,
            multiplier: 1,
            constant: -textFieldSpace))
        
        //leading
        textFields.addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
        
        //trailing
        textFields.addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
        
        password.addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: textFieldHeight))
        
        //bottom
        textFields.addConstraint(NSLayoutConstraint(
            item: email,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: password,
            attribute: .Top,
            multiplier: 1,
            constant: -textFieldSpace))
        
        //leading
        textFields.addConstraint(NSLayoutConstraint(
            item: email,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
        
        //trailing
        textFields.addConstraint(NSLayoutConstraint(
            item: email,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
        
        //height
        email.addConstraint(NSLayoutConstraint(
            item: email,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: textFieldHeight))
        
        //textField height
        textFields.addConstraint(NSLayoutConstraint(
            item: textFields,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: email,
            attribute: .Top,
            multiplier: 1,
            constant: 0))
        
        //bottom
        view.addConstraint(NSLayoutConstraint(
            item: branding,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: textFields,
            attribute: .Top,
            multiplier: 1,
            constant: -textFieldSpace))
        
        //leading
        view.addConstraint(NSLayoutConstraint(
            item: branding,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
        
        //leading
        view.addConstraint(NSLayoutConstraint(
            item: branding,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
        
        //top
        view.addConstraint(NSLayoutConstraint(
            item: branding,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1,
            constant: 0))
        
//        //bottom brandingImage
//        view.addConstraint(NSLayoutConstraint(
//            item: brandingImage,
//            attribute: .Bottom,
//            relatedBy: .Equal,
//            toItem: branding,
//            attribute: .Top,
//            multiplier: 1,
//            constant: -textFieldSpace))
//        
//        //leading brandingImage
//        view.addConstraint(NSLayoutConstraint(
//            item: brandingImage,
//            attribute: .Leading,
//            relatedBy: .Equal,
//            toItem: view,
//            attribute: .Leading,
//            multiplier: 1,
//            constant: 0))
//        
//        //leading brandingImage
//        view.addConstraint(NSLayoutConstraint(
//            item: brandingImage,
//            attribute: .Trailing,
//            relatedBy: .Equal,
//            toItem: view,
//            attribute: .Trailing,
//            multiplier: 1,
//            constant: 0))
        
//        //top brandingImage
//        branding.addConstraint(NSLayoutConstraint(
//            item: brandingImage,
//            attribute: .Top,
//            relatedBy: .Equal,
//            toItem: branding,
//            attribute: .Top,
//            multiplier: 1,
//            constant: 0))
        
//        //height
//        brandingImage.addConstraint(NSLayoutConstraint(
//            item: brandingImage,
//            attribute: .Height,
//            relatedBy: .Equal,
//            toItem: nil,
//            attribute: .NotAnAttribute,
//            multiplier: 1,
//            constant: textFieldHeight))
    }
    
    func buttonAction()
    {
        performSegueWithIdentifier("loginToMain", sender: nil)
    }
    
}

