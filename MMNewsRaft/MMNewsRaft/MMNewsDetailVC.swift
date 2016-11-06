//
//  MMDetailNewsVC.swift
//  MMNews
//
//  Created by Musthafa PP, Muhammed on 11/5/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsDetailVC: UIViewController {

    
    @IBOutlet weak var webView: UIWebView?
    var articlesModel : ArticlesModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        CommonActivityVC.showActivityViewer()

        let url = NSURL (string:articlesModel.url!);
        let request = NSURLRequest(URL: url!);
        webView!.loadRequest(request);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func webViewDidStartLoad(webView : UIWebView) {
//        CommonActivityVC.showActivityViewer()
//        print("AA")
//    }
    
    func webViewDidFinishLoad(webView : UIWebView) {
        CommonActivityVC.hideActivityViewer()
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
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
