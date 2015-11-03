//
//  SecondViewController.swift
//  Todo App
//
//  Created by Zach Larsen on 9/15/15.
//  Copyright (c) 2015 Zach Larsen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBAction func Button(sender: UIButton) {
        
        todoItems.append(textField.text!)
        NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: "todoList")
        textField.resignFirstResponder()
        textField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

