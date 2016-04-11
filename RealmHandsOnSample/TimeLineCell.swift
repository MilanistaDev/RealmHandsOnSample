//
//  TimeLineCell.swift
//  RealmHandsOnSample
//
//  Created by 麻生 拓弥 on 2016/04/11.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

import UIKit

class TimeLineCell: UITableViewCell {

    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var useNameLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.autoresizingMask = autoresizingMask
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
