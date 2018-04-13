//
//  ProfileCell.swift
//  GoforGold
//
//  Created by Anson Ng on 22/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    let leftLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "Show"
        return label
    }()
    
    let tapButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
//        addSubview(tapButton)
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        
        leftLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0))
        rightLabel.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 10))
//        tapButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero)
    }
}
