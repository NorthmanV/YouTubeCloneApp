//
//  HomeViewController.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 05/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        navigationController?.navigationBar.isTranslucent = false
        navigationController!.navigationBar.barStyle = .blackOpaque
        navigationController!.navigationBar.isTranslucent = false
        navigationController!.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: navigationController!.navigationBar.bounds.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.shadowImage = UIImage()
        setupMenuBar()
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

