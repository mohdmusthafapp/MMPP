//
//  MMMenuTopView.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/30/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMMenuTopView: UIView {

    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MMMenuTopView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! MMMenuTopView
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    

}
