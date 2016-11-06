//
//  MMNewsRaftSourceModel.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class SourceModel: NSObject/* NSCopying*/ {
    
    var id :String?
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
    
    convenience init(dictionary:NSDictionary) {
        self.init()
        self.id = dictionary.objectForKey("id") as? String
        self.source_code = dictionary.objectForKey("source_code") as? String
        self.name = dictionary.objectForKey("name") as? String
        self.source_description = dictionary.objectForKey("description") as? String
        self.url = dictionary.objectForKey("url") as? String
        self.category = dictionary.objectForKey("category") as? String
        self.language = dictionary.objectForKey("language") as? String
        self.country = dictionary.objectForKey("country") as? String
        self.logo_small = dictionary.objectForKey("logo_small") as? String
        self.logo_medium = dictionary.objectForKey("logo_medium") as? String
        self.logo_large = dictionary.objectForKey("logo_large") as? String
        self.created_at = dictionary.objectForKey("created_at") as? String
        self.updated_at = dictionary.objectForKey("updated_at") as? String
        self.source_parent = dictionary.objectForKey("source_parent") as? String
        self.sort_by = dictionary.objectForKey("sort_by") as? String
    }
    
    /*
     "id" : "12",
     "description" : "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
     "category" : "general",
     "source_parent" : "NEWSAPI.ORG",
     "sort_by" : "top",
     "active" : "1",
     "logo_large" : "http:\/\/i.newsapi.org\/abc-news-au-l.png",
     "created_at" : "2016-10-16 23:01:42",
     "url" : "http:\/\/www.abc.net.au\/news",
     "logo_medium" : "http:\/\/i.newsapi.org\/abc-news-au-m.png",
     "source_code" : "abc-news-au",
     "language" : "English",
     "updated_at" : "2016-10-16 23:01:42",
     "logo_small" : "http:\/\/i.newsapi.org\/abc-news-au-s.png",
     "country" : "Australia",
     "name" : "ABC News (AUS)"
 */
}
