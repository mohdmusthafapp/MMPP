//
//  MMNewsRaftTableViewCell.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMCardCell: UITableViewCell {

    
    @IBOutlet weak var source_Image: UIImageView?
    @IBOutlet weak var source_description: UILabel?
    @IBOutlet weak var source_title: UILabel?
    @IBOutlet weak var cardButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
