//
//  MenuBar.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 09/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let imageNames = ["home", "trending", "subscriptions", "account"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colletctionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletctionView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        colletctionView.dataSource = self
        colletctionView.delegate = self
        return colletctionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
