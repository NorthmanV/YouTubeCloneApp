//
//  BaseCell.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 09/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
