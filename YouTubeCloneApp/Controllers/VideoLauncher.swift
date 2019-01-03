//
//  VideoLauncher.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 03/01/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class VideoLauncher {
    
    func showVideoPlayer() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10))
            view.backgroundColor = .white
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerView = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height))
            view.addSubview(videoPlayerView)

            keyWindow.addSubview(view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                view.frame = keyWindow.frame
            }) { (isCompleted) in
                keyWindow.windowLevel = UIWindow.Level.statusBar
            }
        }
    }
    
}
