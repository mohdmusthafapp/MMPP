//
//  ArticlesModel.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/31/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class ArticlesModel: NSObject {
    
    var id :String?
    var source :String?
    var author :String?
    var title :String?
    var source_description :String?
    var url :String?
    var urlToImage :String?
    var publishedAt :String?
    var created_at :String?
    var updated_at :String?
    
    convenience init(dictionary:NSDictionary) {
        self.init()
        let keys = dictionary.allKeys
        for key in keys {
            dictionary.objectForKey(keys) as? String
            
        }
        self.id = dictionary.objectForKey("id") as? String
        self.source = dictionary.objectForKey("source") as? String
        self.author = dictionary.objectForKey("author") as? String
        self.title = dictionary.objectForKey("title") as? String
        self.url = dictionary.objectForKey("url") as? String
        self.source_description = dictionary.objectForKey("description") as? String
        self.urlToImage = dictionary.objectForKey("urlToImage") as? String
        self.publishedAt = dictionary.objectForKey("publishedAt") as? String
        self.created_at = dictionary.objectForKey("created_at") as? String
        self.updated_at = dictionary.objectForKey("updated_at") as? String
    }
    
    /*
    {
    "source" : "cnn",
    "author" : "Jill Martin, CNN",
    "urlToImage" : "http:\/\/i2.cdn.turner.com\/cnnnext\/dam\/assets\/161030212637-07-world-series-game-5-1030-super-tease.jpg",
    "id" : 26451,
    "created_at" : "2016-10-31 04:00:24",
    "title" : "Chicago Cubs stay alive, win World Series Game 5",
    "publishedAt" : "2016-10-31T03:45:00Z",
    "description" : "The Cubs aren't done just yet, sending the World Series back to Cleveland after winning Game 5.",
    "updated_at" : "2016-10-31 04:00:24",
    "url" : "http:\/\/edition.cnn.com\/2016\/10\/30\/sport\/world-series-game-5-cleveland-indians-chicago-cubs\/index.html"
     },*/

}
