//
//  FavoriteViewController.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/10.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favoritesTableView: UITableView!

    var favoritesTweet: Results<TweetModel>?
    var notificationToken: NotificationToken?

    // MARK:- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self

        // Register Cell
        self.favoritesTableView.registerNib(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "favoriteCell")
        self.favoritesTableView.rowHeight = UITableViewAutomaticDimension
        self.favoritesTableView.estimatedRowHeight = 90

        // インスタンス生成
        let realm = try! Realm()

        // 検索条件を追加(お気に入りがTrueのときのものを取得)
        self.favoritesTweet = realm.objects(TweetModel).filter("favorited = true")

        // こいつが変わったら通知するトークン
        notificationToken = self.favoritesTweet?.addNotificationBlock({ (Results, Error) -> () in
            // 更新するものはここに書く
            self.favoritesTableView.reloadData()
        })
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        self.tabBarController?.navigationItem.title = "Favorite Tweet"
    }

    // MARK: - TableView DataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.favoritesTweet?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! FavoriteCell

        // お気に入りのツイート indexPath.row に対応する値軍をモデルに展開
        //  の indexPath.row に対応する値軍をモデルに展開
        let tweet: TweetModel = self.favoritesTweet![indexPath.row]

        cell.userNameLabel.text = tweet.name
        cell.tweetTextView.text = tweet.text
        let urlStr: String = tweet.iconURL

        do {
            // アイコン画像の URL 指定
            let url: NSURL = NSURL(string: urlStr)!
            // NSData として取得
            let imageData: NSData = try NSData(contentsOfURL: url,
                                               options: NSDataReadingOptions.DataReadingMappedIfSafe)
            // 取得した NSData を UIImage に変換
            cell.userIconImageView.image = UIImage(data: imageData)
        } catch {
            print("Exception")
        }
        return cell
    }

    // MARK: - TableView Delegate Method

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    // MARK:- Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
