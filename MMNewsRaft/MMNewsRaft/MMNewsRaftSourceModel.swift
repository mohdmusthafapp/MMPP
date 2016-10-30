//
//  MMNewsRaftSourceModel.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsRaftSourceModel: NSObject/* NSCopying*/ {
    
    var source_code :String?
    var name :String?
    var source_description :String?
    var url :String?
    var category :String?
    var language :String?
    var country :String?
    var logo_small :String?
    var logo_medium :String?
    var logo_large :String?
    var created_at :String?
    var updated_at :String?
    var source_parent :String?
    var sort_by :String?
    
  override   init() {
        self.source_code = String()
        self.name = String()
        self.source_description = String()
        self.url = String()
        self.category = String()
        self.language = String()
        self.country = String()
        self.logo_small = String()
        self.logo_large = String()
        self.logo_large = String()
        self.created_at = String()
        self.updated_at = String()
        self.source_parent = String()
        self.sort_by = String()
    }
    func updateValue(dictionary:NSDictionary) {
        self.source_code = dictionary.objectForKey("source_code") as? String
        self.name = dictionary.objectForKey("name") as? String
        self.source_description = dictionary.objectForKey("description") as? String
        self.url = dictionary.objectForKey("url") as? String
        self.category = dictionary.objectForKey("category") as? String
        self.language = dictionary.objectForKey("language") as? String
        self.country = dictionary.objectForKey("country") as? String
        self.logo_small = dictionary.objectForKey("logo_small") as? String
        self.logo_large = dictionary.objectForKey("logo_large") as? String
        self.logo_large = dictionary.objectForKey("logo_large") as? String
        self.created_at = dictionary.objectForKey("created_at") as? String
        self.updated_at = dictionary.objectForKey("updated_at") as? String
        self.source_parent = dictionary.objectForKey("source_parent") as? String
        self.sort_by = dictionary.objectForKey("sort_by") as? String
    }
}
