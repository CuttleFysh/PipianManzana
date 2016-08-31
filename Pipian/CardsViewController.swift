//
//  CardsViewController.swift
//  Pipian
//
//  Created by CuttleFysh on 7/6/16.
//  Copyright © 2016 CuttleFysh. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    var items: [Int] = []
    
    @IBOutlet weak var carousel: iCarousel!
   
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for i in 0...99
        {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation controller modifications: COLOR MODIFICATIONS
        navigationController!.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        // User button on nav bar
        let buttonU = UIBarButtonItem(title: "My card", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(openUser))
        navigationItem.leftBarButtonItem = buttonU
        /* User button with image
        let buttonU = UIButton()
        buttonU.frame = CGRectMake(0, 0, 31, 31)
        buttonU.setImage(UIImage(named: "cardtemp.png"), forState: .Normal)
        buttonU.addTarget(self, action: #selector(openUser),forControlEvents: .TouchUpInside)
        let userButton = UIBarButtonItem()
        userButton.customView = buttonU
        navigationItem.leftBarButtonItem = userButton;*/
        // Exchange button on nav bar
        let buttonE = UIButton()
        buttonE.frame = CGRectMake(0, 0, 31, 31)
        buttonE.setImage(UIImage(named: "canrdtemp.png"), forState: .Normal)
        buttonE.addTarget(self, action: #selector(openExg),forControlEvents: .TouchUpInside)
        let exgButton = UIBarButtonItem()
        exgButton.customView = buttonE
        navigationItem.rightBarButtonItem = exgButton;
        //iCarousel
        carousel.type = .Linear
        carousel.vertical = true
        
        
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
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var label: UILabel
        var itemView: UIImageView
        
        if (view == nil)
        {
            itemView = UIImageView(frame:CGRect(x: 0, y: 0, width: 200, height: 200))
            itemView.image = UIImage(named: "cardtemp.png")
            itemView.contentMode = .Center
            
            /*label = UILabel(frame: itemView.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            itemView.addSubview(label)*/
        }
        else
        {
            itemView = view as! UIImageView
            /*label = itemView.viewWithTag(1) as! UILabel!*/
        }
        
        //label.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, iwthDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
    }
    
    func carousel(carousel: iCarousel, didSelectItemAtIndex index: Int) {
        print("clicked carousel view")
        let otherViewController = self.storyboard!.instantiateViewControllerWithIdentifier("OtherViewController") as! OtherViewController
        self.navigationController?.pushViewController(otherViewController, animated: true)
    }
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        print(self.carousel.currentItemIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

