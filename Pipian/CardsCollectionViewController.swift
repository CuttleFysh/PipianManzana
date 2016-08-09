//
//  CardsCollectionViewController.swift
//  Pipian
//
//  Created by CuttleFysh on 7/7/16.
//  Copyright © 2016 CuttleFysh. All rights reserved.
//

import UIKit

class CardsCollectionViewController: UICollectionViewController
{
    private let reuseIdentifier = "CardCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    /*private var searches = [FlickrSearchREsults]()
    private let flickr = FLickr()
    
    func photoForIndexPath(indexPath: NSIndexPath) -> FlickrPhoto
    {
        return searches[indexPath.section].searchREsults[indexPath.row]
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationController!.navigationBar.barTintColor = UIColor(red: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        let buttonU = UIButton()
        buttonU.frame = CGRectMake(0, 0, 51, 31) //won't work if you don't set frame
        buttonU.setImage(UIImage(named: "profile-user.png"), forState: .Normal)
        buttonU.addTarget(self, action: #selector(openUser),forControlEvents: .TouchUpInside)
        let userButton = UIBarButtonItem()
        userButton.customView = buttonU
        navigationItem.leftBarButtonItem = userButton;
        
        let buttonE = UIButton()
        buttonE.frame = CGRectMake(0, 0, 51, 31) //won't work if you don't set frame
        buttonE.setImage(UIImage(named: "shuffle.png"), forState: .Normal)
        buttonE.addTarget(self, action: #selector(openExg),forControlEvents: .TouchUpInside)
        let exgButton = UIBarButtonItem()
        exgButton.customView = buttonE
        navigationItem.rightBarButtonItem = exgButton;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func openUser()
    {
        let userViewController = self.storyboard!.instantiateViewControllerWithIdentifier("UserViewController") as! UserViewController
        self.navigationController?.pushViewController(userViewController, animated: true)
    }
    
    func openExg()
    {
        let exchangeViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ExchangeViewController") as! ExchangeViewController
        self.navigationController?.pushViewController(exchangeViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension CardsCollectionViewController
{
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override func collectionView(collectionVew: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 24
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()
        // configuration of the cell
        return cell
    }
    
}