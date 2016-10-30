//
//  MMMenuCell.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/29/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMMenuCell: UITableViewCell {

    @IBOutlet weak var mmMenuImageView: UIImageView?
    @IBOutlet weak var mmMenuTextLabel: UILabel?
    static let menuCellReuseIdentifier = "MMMenuCellReuseIdentifier"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
