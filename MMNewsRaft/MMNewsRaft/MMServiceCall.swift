//
//  MMServiceCall.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMServiceCall: NSObject {
    
    func callWebService(mmWebServiceRequest:MMServiceRequest,
                                  completion: (resultData:NSData?, response:NSURLResponse?, error:NSError?) -> Void) {
            let request = NSMutableURLRequest(URL: NSURL(string: mmWebServiceRequest.requestURL!)!)
            let session = NSURLSession.sharedSession()
            request.HTTPMethod = mmWebServiceRequest.requestHTTPMethod!
        if ((mmWebServiceRequest.requestBody?.count) != nil) {
            request.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(mmWebServiceRequest.requestBody!, options: [])
        }
        request.addValue("text/html", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
                data, response, error -> Void in
                
                completion(resultData: data, response: response, error: error)
        })
        task.resume()
    }
    
    
    func callWebServiceFromURL(mmWebServiceRequest:MMServiceRequest, completion: (resultData:NSData?) -> Void) {
        
        let requestURL =  NSURL(string: mmWebServiceRequest.requestURL!)
        do {
            let responseData = try  NSData(contentsOfURL:requestURL!, options: NSDataReadingOptions())
            completion(resultData: responseData)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
