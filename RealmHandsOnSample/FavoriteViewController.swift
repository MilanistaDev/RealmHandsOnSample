//
//  FavoriteViewController.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/10.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var favoritesTableView: UITableView!

    // MARK:- Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self

        // Register Cell
        self.favoritesTableView.registerNib(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "favoriteCell")
        self.favoritesTableView.rowHeight = UITableViewAutomaticDimension
        self.favoritesTableView.estimatedRowHeight = 90
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

        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! FavoriteCell

        cell.userNameLabel.text = "UserName"
        cell.tweetTextView.text = "Test\nTest\nTest\nTest\n"
        cell.userIconImageView.image = UIImage(named: "icon_favorites")

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
