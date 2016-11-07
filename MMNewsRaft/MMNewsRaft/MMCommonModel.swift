//
//  MMCommonModel.swift
//  MMNews
//
//  Created by Musthafa PP, Muhammed on 11/6/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit
struct Static {
    static var onceToken: dispatch_once_t = 0
    static var instance: MMCommonModel? = nil
    static let mmNewsRootVCKey = "MMNewsRootVCKEY"
}
class MMCommonModel: NSObject {

    var articesList : [ArticlesModel]
    var sourceList : [SourceModel]
    var articleUrl : String?
    var selcetedSource :String?
    
    override init() {
        self.articesList = [ArticlesModel]()
        self.sourceList = [SourceModel]()
        self.selcetedSource = String()
    }
    class var sharedInstance: MMCommonModel {
        dispatch_once(&Static.onceToken) {
           
            Static.instance = MMCommonModel.init()
        }
        return Static.instance!
    }
    
    func getArtices() -> [ArticlesModel]? {
       return self.articesList
    }
    
    func getSource() -> [SourceModel]? {
        return self.sourceList
    }
    
    //MARK: Defaults Settings
    class func doesRootViewLoadFirst() -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.valueForKey(Static.mmNewsRootVCKey) as! Bool
            
            //defaults.setBool(NOSTR, forKey: Static.mmNewsRootVCKey)
    }
    
    class func UpdateRootViewLoadFirst(value:Bool)  {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(value, forKey: Static.mmNewsRootVCKey)
    }
}

