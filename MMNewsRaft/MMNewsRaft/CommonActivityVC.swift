//
//  CommonActivityViewController.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 11/1/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

struct CommonActivityVCConstants {
    
    static let activityMainViewTag:Int = 1234567890
    static let activityTitleTag:Int = 1234567891
    static let activityIndicatorTag:Int = 1234567892
    static let activityTitleFrame  = CGRectMake(0, 0, 120, 60)
}
class CommonActivityVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    class func createActivityMainView() -> UIView? {
        let appDelegate = UIApplication.sharedApplication().delegate
        let window:UIWindow = appDelegate!.window!!
        let activityMainView = UIView.init(frame: window.bounds)
        activityMainView.backgroundColor = UIColor.clearColor()
        activityMainView.alpha = 0.9
        activityMainView.tag = CommonActivityVCConstants.activityMainViewTag;
        return activityMainView
    }
   
    class func createActivityTitleView() -> UIView? {
        let activityTitleView = UIView.init(frame: CommonActivityVCConstants.activityTitleFrame)
        activityTitleView.tag = CommonActivityVCConstants.activityTitleTag
        activityTitleView.backgroundColor = UIColor.blackColor()
        activityTitleView.layer.cornerRadius = 10
        activityTitleView.layer.borderColor = UIColor.whiteColor().CGColor
        activityTitleView.layer.borderWidth = 2.0
        return activityTitleView;
    }
    
    class func createActivityIndicator() -> UIActivityIndicatorView? {
        let activityIndicator = UIActivityIndicatorView.init(frame: CGRectMake(50,10, 20, 20))
        activityIndicator.tag = CommonActivityVCConstants.activityIndicatorTag
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        activityIndicator.hidesWhenStopped = false
        return activityIndicator
    }
    class func showActivityViewer() {
        
        let appDelegate = UIApplication.sharedApplication().delegate
        let window:UIWindow = appDelegate!.window!!
        
//        let activityVC = window.viewWithTag(CommonActivityVCConstants.activityIndicatorTag)
//        guard activityVC != nil else{
//            return
//        }
        let activityMainView = createActivityMainView()
        let activityTitleView = createActivityTitleView()
        activityMainView!.addSubview(activityTitleView!)
        activityTitleView!.center = activityMainView!.center
        
        let textLabel = UILabel.init(frame: CGRectMake(0,30, 120, 20))
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = "Please wait..."
        textLabel.font = textLabel.font.fontWithSize(10)
        textLabel.textColor = UIColor.whiteColor()
        
        activityTitleView!.addSubview(textLabel)
        let activityIndicator = createActivityIndicator()
        
        // Start Activity Indicator
        activityIndicator!.startAnimating()
        activityTitleView!.addSubview(activityIndicator!)
        window.addSubview(activityMainView!)
        
    }
    class func hideActivityViewer(){
        let appDelegate = UIApplication.sharedApplication().delegate
        let window:UIWindow = appDelegate!.window!!
        let activityView = window.viewWithTag(CommonActivityVCConstants.activityMainViewTag)
        if (activityView != nil) {
            let activityINDICATOR = window.viewWithTag(CommonActivityVCConstants.activityIndicatorTag) as! UIActivityIndicatorView
            activityINDICATOR.stopAnimating()
            activityView?.removeFromSuperview()
        }
    }
}
