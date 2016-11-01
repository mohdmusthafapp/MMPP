//
//  CommonActivityViewController.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 11/1/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class CommonActivityVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    class func showActivityViewer() {
        
        let appDelegate = UIApplication.sharedApplication().delegate
        let window:UIWindow = appDelegate!.window!!
        let activityView = UIView.init(frame: window.bounds)
        activityView.backgroundColor = UIColor.clearColor()
        activityView.alpha = 0.9
        activityView.tag = 1000009;
        let smallView = UIView.init(frame: CGRectMake(0, 0, 120, 60))
        activityView.addSubview(smallView)
        smallView.center = activityView.center
        smallView.backgroundColor = UIColor.blackColor()//.init(red: 0.0/255, green: 0.0/255, blue: 50.0/255, alpha: 1)
        
        smallView.layer.cornerRadius = 10
        smallView.layer.borderColor = UIColor.whiteColor().CGColor
        smallView.layer.borderWidth = 2.0
        let textLabel = UILabel.init(frame: CGRectMake(0,30, 120, 20))
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = "Please wait..."
        textLabel.font = textLabel.font.fontWithSize(10)
        textLabel.textColor = UIColor.whiteColor()
        
        smallView.addSubview(textLabel)
        let myActivityIndicator = UIActivityIndicatorView.init(frame: CGRectMake(50,10, 20, 20))
    
        // Position Activity Indicator in the center of the main view
       
        
        myActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        //myActivityIndicator.autoresizingMask = [.FlexibleWidth, .FlexibleTopMargin]
        
        // myActivityIndicator.center = CGPointMake(CGRectGetMidX(smallView.bounds), CGRectGetMidY(smallView.bounds));
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        smallView.addSubview(myActivityIndicator)
        
        window.addSubview(activityView)
        
    }
    class func hideActivityViewer(){
        let appDelegate = UIApplication.sharedApplication().delegate
        let window:UIWindow = appDelegate!.window!!
        let activityView = window.viewWithTag(1000009)
        if (activityView != nil) {
            activityView?.removeFromSuperview()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
