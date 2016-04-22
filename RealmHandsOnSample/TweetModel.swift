//
//  TweetModel.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/15.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class TweetModel: RealmSwift.Object {

    // プロパティ(KVOの監視対象になるプロパティにはdynamicをつける)
    dynamic var name = ""
    dynamic var text = ""
    dynamic var iconURL = ""
    // Tweetの重複を防ぐためのID(IDだとバッティングしない)
    dynamic var tweetId = ""
    // お気に入り用プロパティ(Bool)
    dynamic var favorited = false

    convenience init(tweetDictionary: [String: AnyObject]) {
        self.init()

        let user = tweetDictionary["user"] as! [String: AnyObject]
        
        self.name = user["name"]! as! String
        self.iconURL = user["profile_image_url"] as! String
        self.text = tweetDictionary["text"] as! String
        self.tweetId = tweetDictionary["id_str"] as! String
    }

    override class func primaryKey() -> String? {
        return "tweetId"
    }
}
