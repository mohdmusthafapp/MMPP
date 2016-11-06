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
    var urlToImage :String?
    var urlToImage_thumbnail :String?
    var publishedAt :String?
    var created_at :String?
    var updated_at :String?
    var url :String?
    
    convenience init(dictionary:NSDictionary) {
        self.init()
        self.id = dictionary.objectForKey("id") as? String
        self.source = dictionary.objectForKey("source") as? String
        self.author = dictionary.objectForKey("author") as? String
        self.title = dictionary.objectForKey("title") as? String
        self.urlToImage = dictionary.objectForKey("urlToImage") as? String
        self.urlToImage_thumbnail = dictionary.objectForKey("urlToImage_thumbnail") as? String
        self.source_description = dictionary.objectForKey("description") as? String
        self.urlToImage = dictionary.objectForKey("urlToImage") as? String
        self.publishedAt = dictionary.objectForKey("publishedAt") as? String
        self.created_at = dictionary.objectForKey("created_at") as? String
        self.updated_at = dictionary.objectForKey("updated_at") as? String
        self.url = dictionary.objectForKey("url") as? String
        
    }
    
    /*
     "id" : "46332",
     "description" : "The publishers of Collins dictionaries have announced their words of the year for 2016.",
     "author" : "Michael Deacon",
     "created_at" : "2016-11-05 01:01:46",
     "url" : "http:\/\/www.telegraph.co.uk\/opinion\/2016\/11\/05\/forget-brexit-and-hygge-the-word-of-the-year-should-be-cuck\/",
     "publishedAt" : "2016-11-05T07:01:16Z",
     "source" : "the-telegraph",
     "title" : "Forget Brexit and hygge. The word of the year should be cuck",
     "urlToImage" : "http:\/\/www.telegraph.co.uk\/content\/dam\/opinion\/2016\/11\/04\/112907459_Donald_Trump_cuck_COMMENT-xlarge_trans++qVzuuqpFlyLIwiB6NTmJwfSVWeZ_vEN7c6bHu2jJnT8.jpg",
     "updated_at" : "2016-11-05 01:01:46",
     "urlToImage_thumbnail}
     */

}
