//
//  ViewController.swift
//  dynamicAnimation
//
//  Created by Zach Larsen on 10/13/15.
//  Copyright © 2015 Zach Larsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func tapGesture(sender: UITapGestureRecognizer) {

        var babySquare: UIView!
        var dimen =  CGRectMake(50,200,100,90)
        babySquare = UIView(frame: dimen)
        babySquare.backgroundColor = UIColor(patternImage: UIImage(named: "download.jpeg")!)
        self.view.addSubview(babySquare!)
        let babyBounce = UIDynamicItemBehavior(items: [babySquare])
        babyBounce.elasticity = 2.0
        let gravity = UIGravityBehavior(items: [babySquare!])
        let boundries = UICollisionBehavior(items: [babySquare!])
        
        boundries.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(boundries)
        animator.addBehavior(gravity)
        animator.addBehavior(babyBounce)

        
    }
    var greenSquare: UIImageView!
    var redSquare: UIView!
    var babySquare: UIView!
    var animator: UIDynamicAnimator!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var dimen =  CGRectMake(25,25,200,200)
        greenSquare = UIImageView(image: UIImage(named: "chainsaw.png"))
        greenSquare.frame = dimen
        dimen =  CGRectMake(130,25,100,100)
        redSquare = UIView(frame: dimen)

        dimen =  CGRectMake(50,200,100,90)
        babySquare = UIView(frame: dimen)
        greenSquare.contentMode = .ScaleAspectFit
        redSquare.backgroundColor = UIColor.redColor()
        babySquare.backgroundColor = UIColor(patternImage: UIImage(named: "download.jpeg")!)
        
        self.view.addSubview(greenSquare!)
        self.view.addSubview(redSquare!)
        self.view.addSubview(babySquare!)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let boundries = UICollisionBehavior(items: [greenSquare!, redSquare!, babySquare!])
        
        boundries.translatesReferenceBoundsIntoBoundary = true
        
        let gravity = UIGravityBehavior(items: [greenSquare!, redSquare!, babySquare!])
        
        let direction = CGVectorMake(0.0, 1.0)
        
        gravity.gravityDirection = direction
        
        let greenBounce = UIDynamicItemBehavior(items: [greenSquare])
        let babyBounce = UIDynamicItemBehavior(items: [babySquare])
        let redBounce = UIDynamicItemBehavior(items: [redSquare])
        greenBounce.elasticity = 1.0
        redBounce.elasticity = 0.5
        babyBounce.elasticity = 1.2
        animator.addBehavior(babyBounce)
        animator.addBehavior(greenBounce)
        animator.addBehavior(redBounce)
        animator.addBehavior(gravity)
        animator.addBehavior(boundries)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

