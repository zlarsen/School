//
//  ViewController.swift
//  Prime Slider
//
//  Created by Zach Larsen on 9/8/15.
//  Copyright (c) 2015 Zach Larsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numOut: UILabel!
    @IBOutlet weak var primeStatement: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBAction func Slider(sender: UISlider) {
        var num = Int(sliderValue.value)
        numOut.text = "\(num)"
        var primeNumList = prime(100)
        if primeNumList[num]
        {
            primeStatement.text = "Is Prime"
            numOut.textColor = UIColor.greenColor()
        }
        else
        {
            primeStatement.text = "Is NOT Prime"
            numOut.textColor = UIColor.redColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prime(n: Int) -> [Bool]
    {
        var sieve = Array(count: n, repeatedValue: true)
        sieve[0] = false
        sieve[1] = false
        for var i = 2; i < n; ++i
        {
            if sieve[i]
            {
                for var j = i*2; j < n; j+=i
                {
                    sieve[j] = false;
                }
            }
        }
        return sieve;
    }
}

