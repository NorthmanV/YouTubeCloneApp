//
//  VideoPlayerView.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 03/01/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        let url = URL(string: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")!
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        layer.addSublayer(playerLayer)
        playerLayer.frame = frame
        player.play()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
