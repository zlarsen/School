//
//  FirstViewController.swift
//  Todo App
//
//  Created by Zach Larsen on 9/15/15.
//  Copyright (c) 2015 Zach Larsen. All rights reserved.
//

import UIKit

var todoItems = [String]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoItems.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: "todoList")
            todoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoItems = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
        todoListTable.reloadData()
    }
}

