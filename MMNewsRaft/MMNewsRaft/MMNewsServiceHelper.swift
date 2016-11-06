//
//  MMNewsRaftServiceHelper.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsServiceHelper: NSObject {
    
    class func getMMNewsRaftSourceList(completion: (sourceModelList:[SourceModel]?,error:NSError?) -> Void) {
      
        let mmServiceRequest = MMServiceRequest.init()
        mmServiceRequest.requestURL = "http://apiservices.newsraft.com/sources"
        let serviceCallObj = MMServiceCall()
        
        serviceCallObj.callWebServiceFromURL(mmServiceRequest) { (resultData) -> Void in
            do {
                let commomInstance = MMCommonModel.sharedInstance
//                var sourceList = [SourceModel]()
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: []) as? NSArray {
                    for dictionary in jsonResult{
                        
                       let sourceModel = SourceModel.init(dictionary: dictionary as! NSDictionary)
                        
                        commomInstance.sourceList.append(sourceModel)
                    }
                }
                dispatch_async(dispatch_get_main_queue(),{
                    
                    completion(sourceModelList: nil, error: nil)
                })
            } catch let error as NSError {
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    completion(sourceModelList: nil, error: error)
                    
                })
            }
        }
    }
    
    class func getArticles(completion: (articles:[ArticlesModel]?,error:NSError?) -> Void) {
        
        let mmServiceRequest = MMServiceRequest.init()
        mmServiceRequest.requestURL = MMCommonModel.sharedInstance.articleUrl
        let serviceCallObj = MMServiceCall()
        
        serviceCallObj.callWebServiceFromURL(mmServiceRequest) { (resultData) -> Void in
            do {
                let commomInstance = MMCommonModel.sharedInstance
                
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: []) as? NSArray {
                    for dictionary in jsonResult{
                        
                        let article = ArticlesModel.init(dictionary: dictionary as! NSDictionary)
                        commomInstance.articesList.append(article)
                    }
                    
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                         completion(articles: nil, error: nil)
                        
                    })
                   
                }
            } catch let error as NSError {
                dispatch_async(dispatch_get_main_queue(),{
                    
                   completion(articles: nil, error: error)
                    
                })
                
            }
        }
    }
    
    
}
