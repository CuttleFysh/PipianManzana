//
//  ExchangeViewController.swift
//  Pipian
//
//  Created by CuttleFysh on 7/6/16.
//  Copyright © 2016 CuttleFysh. All rights reserved.
//

import  UIKit

class ExchangeViewController: UIViewController, UITableViewDelegate,
    UITableViewDataSource
{
    @IBOutlet var tableView: UITableView!
    var exchanges = [[String]]()
    var exSections = [String]()
    var nameCell = [String]()
    var infoCell = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        exchanges = [["11/03/2016", "11:22", "Elliot Rage"], ["11/03/2016", "10:32", "Reginald Fitz"], ["10/03/2016", "9:56", "George Platz"]]
        nameCell = ["Degree", "Name", "Company", "Position", "Phone",
                    "E-mail", "Website", "Twitter", "Facebook", "LinkedIn"]
        infoCell = ["-", "Jose Tlacuilo", "CuttleFysh Co.", "Founder", "+527771100038",
                    "jose.tlacuilo@gmail.com", "cuttlefysh.com", "@tlacuilose", "./TlacuiloJose", "-"]
        print(exchanges.count)
        for i in 0..<exchanges.count
        {
            print(i)
            exSections.append(exchanges[i][0])            
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return exSections.count
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
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return exSections[section]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
