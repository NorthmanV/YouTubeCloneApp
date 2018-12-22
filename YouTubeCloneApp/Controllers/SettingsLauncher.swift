//
//  SettingsLauncher.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 22/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class SettingsLauncher {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            let blackView = UIView()
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            blackView.addSubview(collectionView)
            let height: CGFloat = 200
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
            self.collectionView.frame = CGRect(x: 0, y: blackView.frame.height, width: blackView.frame.height, height: 200)
        }) { (_) in
            blackView.removeFromSuperview()
        }
    }

    
}
