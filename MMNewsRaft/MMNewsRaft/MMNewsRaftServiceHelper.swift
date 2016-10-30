//
//  MMNewsRaftServiceHelper.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsRaftServiceHelper: NSObject {
    
    class func getMMNewsRaftSourceList() -> [MMNewsRaftSourceModel]? {
      
        let mmServiceRequest = MMServiceRequest.init()
        mmServiceRequest.requestURL = "http://apiservices.newsraft.com/sources"
        let rC = MMServiceCall()
        var sourceList = [MMNewsRaftSourceModel]()
        rC.callWebServiceFromURL(mmServiceRequest) { (resultData) -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: []) as? NSArray {
                    for dictionary in jsonResult{
                        
                       let sourceModel = MMNewsRaftSourceModel()
                        sourceModel.updateValue(dictionary as! NSDictionary)
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
