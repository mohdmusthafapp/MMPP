//
//  MMNewsRaftServiceHelper.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsServiceHelper: NSObject {
    
    class func getMMNewsRaftSourceList() -> [SourceListModel]? {
      
        let mmServiceRequest = MMServiceRequest.init()
        mmServiceRequest.requestURL = "http://apiservices.newsraft.com/sources"
        let serviceCallObj = MMServiceCall()
        var sourceList = [SourceListModel]()
        serviceCallObj.callWebServiceFromURL(mmServiceRequest) { (resultData) -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: []) as? NSArray {
                    for dictionary in jsonResult{
                        
                       let sourceModel = SourceListModel.init(dictionary: dictionary as! NSDictionary)
                        sourceList.append(sourceModel)
                    }
                    print("ASynchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return sourceList;
    }
    
    class func getArticles() -> [ArticlesModel]? {
        
        let mmServiceRequest = MMServiceRequest.init()
        mmServiceRequest.requestURL = "http://apiservices.newsraft.com/todays/25"
        let serviceCallObj = MMServiceCall()
        var sourceList = [ArticlesModel]()
        serviceCallObj.callWebServiceFromURL(mmServiceRequest) { (resultData) -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: []) as? NSArray {
                    for dictionary in jsonResult{
                        
                        let sourceModel = ArticlesModel.init(dictionary: dictionary as! NSDictionary)
                        sourceList.append(sourceModel)
                    }
                    print("ASynchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return sourceList;
    }
}
