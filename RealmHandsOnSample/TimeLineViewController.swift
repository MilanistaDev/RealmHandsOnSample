//
//  TimeLineViewController.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/10.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit
import Accounts
import Social

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var timeLineTableView: UITableView!

    var account: ACAccount?
    var timeLine = [TweetModel]()

    // MARK:- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.timeLineTableView.delegate = self
        self.timeLineTableView.dataSource = self

        // Register Cell
        self.timeLineTableView.registerNib(UINib(nibName: "TimeLineCell", bundle: nil), forCellReuseIdentifier: "timeLineCell")
        self.timeLineTableView.rowHeight = UITableViewAutomaticDimension
        self.timeLineTableView.estimatedRowHeight = 90

        // Twitter の認証系
        // インスタンス生成
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted, error) -> Void in
            if granted {
                let accounts = accountStore.accountsWithAccountType(accountType)
                if let account = accounts.first as? ACAccount {
                        self.account = account
                        self.getHomeTimeLine()
                } else {

                }
            } else {

            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        self.tabBarController?.navigationItem.title = "TimeLine"
    }

    // MARK:- Private Method

    /*
     Twitter API を叩いてツイートを取得
    */
    func getHomeTimeLine() {
        // リクエストするURL
        let requestURL = NSURL(string: "https://api.twitter.com/1/statuses/home_timeline.json")
        // リクエストを作成
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, URL: requestURL, parameters: nil)
        request.account = account
        request.performRequestWithHandler { (data, response, error) -> Void in
            let results = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
            let tweet = results as! [[String: AnyObject]]
            // timeLine に使用する情報を格納する
            // TweetModel の convenience init で 取得した数の分のツイート情報(name, iconURL, text)が入る
            self.timeLine = tweet.map {
                return TweetModel(tweetDictionary: $0)
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.timeLineTableView.reloadData()
            }
        }
    }

    // MARK: - TableView DataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.timeLine.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("timeLineCell", forIndexPath: indexPath) as! TimeLineCell

        // timeLine の indexPath.row に対応する値軍をモデルに展開
        let tweet: TweetModel = timeLine[indexPath.row]

        cell.useNameLabel.text = tweet.name
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
