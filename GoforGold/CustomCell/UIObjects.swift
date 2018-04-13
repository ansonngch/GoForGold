//
//  UIObjects.swift
//  GoforGold
//
//  Created by Anson Ng on 23/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
