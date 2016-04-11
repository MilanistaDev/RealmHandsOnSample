//
//  TimeLineViewController.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/10.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var timeLineTableView: UITableView!

    // MARK:- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.timeLineTableView.delegate = self
        self.timeLineTableView.dataSource = self

        // Register Cell
        self.timeLineTableView.registerNib(UINib(nibName: "TimeLineCell", bundle: nil), forCellReuseIdentifier: "timeLineCell")
        self.timeLineTableView.rowHeight = UITableViewAutomaticDimension
        self.timeLineTableView.estimatedRowHeight = 90
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        self.tabBarController?.navigationItem.title = "TimeLine"
    }

    // MARK: - TableView DataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("timeLineCell", forIndexPath: indexPath) as! TimeLineCell

        cell.useNameLabel.text = "UserName"
        cell.tweetTextView.text = "Test\nTest\nTest\nTest\n"
        cell.userIconImageView.image = UIImage(named: "icon_timeline")

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
