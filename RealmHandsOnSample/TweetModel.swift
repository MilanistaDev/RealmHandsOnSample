//
//  TweetModel.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/15.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit

class TweetModel: NSObject {

    // プロパティ
    var name = ""
    var text = ""
    var iconURL = ""

    convenience init(tweetDictionary: [String: AnyObject]) {
        self.init()

        let user = tweetDictionary["user"] as! [String: AnyObject]
        
        self.name = user["name"]! as! String
        self.iconURL = user["profile_image_url"] as! String
        self.text = tweetDictionary["text"] as! String
    }
}
