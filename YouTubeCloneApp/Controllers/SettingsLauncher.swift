//
//  SettingsLauncher.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 22/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    let settings = [Setting(name: "Settings", imageName: "settings"),
                    Setting(name: "Terms & Privacy Policy", imageName: "privacy"),
                    Setting(name: "Send Feedback", imageName: "feedback"),
                    Setting(name: "Help", imageName: "help"),
                    Setting(name: "Switch Account", imageName: "account_dark"),
                    Setting(name: "Cancel", imageName: "cancel")]
    
    override init() {
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            let blackView = UIView()
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            blackView.addSubview(collectionView)
            let height: CGFloat = CGFloat(settings.count) * cellHeight
            let y = blackView.frame.height - height
            collectionView.frame = CGRect(x: 0, y: blackView.frame.height, width: blackView.frame.width, height: height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: blackView.frame.width, height: height)
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss(recognizer: UITapGestureRecognizer) {
        let blackView = recognizer.view!
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            blackView.alpha = 0
            self.collectionView.frame = CGRect(x: 0, y: blackView.frame.height, width: blackView.frame.width, height: 200)
        }) { (_) in
            blackView.removeFromSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        cell.setting = settings[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}