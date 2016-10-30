//
//  MMServiceRequest.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMServiceRequest: NSObject {
    
        var requestURL:String?
        var requestHTTPMethod:String?
        var requestBody: Dictionary<String, String>?
        var requestHeader: Dictionary<String, String>?
    
    override init() {
        self.requestURL = String()
        self.requestHTTPMethod = String()
        self.requestBody = Dictionary()
        self.requestHeader = Dictionary()
    }
}
