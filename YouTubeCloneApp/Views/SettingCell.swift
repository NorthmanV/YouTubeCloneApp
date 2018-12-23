//
//  SettingCell.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 23/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            iconImageView.image = UIImage(named: setting!.imageName)?.withRenderingMode(.alwaysTemplate)
            iconImageView.tintColor = .darkGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : .white
            nameLabel.textColor = isHighlighted ? .white : .darkGray
            iconImageView.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(iconImageView)
        addSubview(nameLabel)
        addConstraintsWithFormat("H:|-8-[v0(24)]-8-[v1]|", views: iconImageView, nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
