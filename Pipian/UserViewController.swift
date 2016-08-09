//
//  UserViewController.swift
//  Pipian
//
//  Created by CuttleFysh on 7/6/16.
//  Copyright © 2016 CuttleFysh. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var tableView: UITableView!
    var nameCell = [String]()
    var infoCell = [String]()
    var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add button on nav bar
        /* If images are needed:
        let buttonA = UIButton()
        buttonA.frame = CGRectMake(0, 0, 31, 31)
        buttonA.setImage(UIImage(named: "shuffle.png"), forState: .Normal)
        buttonA.addTarget(self, action: #selector(openAdd),forControlEvents: .TouchUpInside)*/
        let buttonA = UIButton(type: UIButtonType.ContactAdd)
        buttonA.addTarget(self, action: #selector(openAdd), forControlEvents: .TouchUpInside)
        let addButton = UIBarButtonItem()
        addButton.customView = buttonA
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(showEditing))
        navigationItem.rightBarButtonItems = [addButton, editButton]
        // Ends nav bar modifications
        // Datasource for table view
        nameCell = ["Degree", "Name", "Company", "Position", "Phone",
                    "E-mail", "Website", "Twitter", "Facebook", "LinkedIn"]
        infoCell = ["-", "Jose Tlacuilo", "CuttleFysh Co.", "Founder", "+527771100038",
                    "jose.tlacuilo@gmail.com", "cuttlefysh.com", "@tlacuilose", "./TlacuiloJose", "-"]
        
    }
    
    func openAdd()
    {
        
    }
    
    func showEditing(sender: UIBarButtonItem)
    {
        let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        let firstCell = tableView.cellForRowAtIndexPath(indexPath) as? InfoTableViewCell
        if (editMode)
        {
            editMode = false
            firstCell?.infoLabel.hidden = false
            firstCell?.infoField.hidden = true
            self.navigationItem.rightBarButtonItems?[1].title = "Edit"
        }
        else
        {
            editMode = true
            firstCell?.infoLabel.hidden = true
            firstCell?.infoField.hidden = false
            self.navigationItem.rightBarButtonItems?[1].title = "Done"
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

