//
//  UserViewController.swift
//  Pipian
//
//  Created by CuttleFysh on 7/6/16.
//  Copyright © 2016 CuttleFysh. All rights reserved.
//

import UIKit

let editingNotificationKey = "editing.has.been.pressed"
let doneNotificationKey = "editing.has.finished"

class UserViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate*/
{
    //@IBOutlet var tableView: UITableView!
    //var nameCell = [String]()
    //var infoCell = [String]()
    var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add button on nav bar
        /* If images are needed:
        let buttonA = UIButton()
        buttonA.frame = CGRectMake(0, 0, 31, 31)
        buttonA.setImage(UIImage(named: "shuffle.png"), forState: .Normal)
        buttonA.addTarget(self, action: #selector(openAdd),forControlEvents: .TouchUpInside)*/
        
        let buttonE = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(showEditing))
        navigationItem.rightBarButtonItem = buttonE
        
        /* If more cards are added
        let buttonA = UIButton(type: UIButtonType.ContactAdd)
        buttonA.addTarget(self, action: #selector(openAdd), forControlEvents: .TouchUpInside)
        let addButton = UIBarButtonItem()
        addButton.customView = buttonA
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(showEditing))
        navigationItem.rightBarButtonItems = [addButton, editButton]*/
        // Ends nav bar modifications
        // Datasource for table view
        /*nameCell = ["Degree", "Name", "Company", "Position", "Phone",
                    "E-mail", "Website", "Twitter", "Facebook", "LinkedIn"]
        infoCell = ["-", "Jose Tlacuilo", "CuttleFysh Co.", "Founder", "+527771100038",
                    "jose.tlacuilo@gmail.com", "cuttlefysh.com", "@tlacuilose", "./TlacuiloJose", "-"]*/
        
    }
    
    func openAdd()
    {
        
    }
    
    func showEditing(sender: UIBarButtonItem)
    {
        NSNotificationCenter.defaultCenter().postNotificationName(editingNotificationKey, object: self)
        /*let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        let firstCell = tableView.cellForRowAtIndexPath(indexPath) as? InfoTableViewCell*/
        if (editMode)
        {
            editMode = false
            NSNotificationCenter.defaultCenter().postNotificationName(doneNotificationKey, object: self)
            //self.navigationItem.rightBarButtonItems?[1].title = "Edit"
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
        else
        {
            editMode = true
            NSNotificationCenter.defaultCenter().postNotificationName(editingNotificationKey, object: self)
            //self.navigationItem.rightBarButtonItems?[1].title = "Done"
            self.navigationItem.rightBarButtonItem?.title = "Done"
        }
    }
    
    /*func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCell.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("infoTableCell", forIndexPath: indexPath) as! InfoTableViewCell
        let row = indexPath.row
        cell.nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cell.nameLabel.text = nameCell[row]
        cell.infoLabel.text = infoCell[row]
        cell.infoField.hidden = true
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Information"
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

