//
//  VideoCell.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 07/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            Dataservice.shared.downloadImage(from: video!.thumbnailImage!) { (image, imageUrl)  in
                if imageUrl == self.video!.thumbnailImage! {
                    self.thumbnailImageView.image = image
                }
            }
            Dataservice.shared.downloadImage(from: video!.channel!.profileImageName!) { (image, imageUrl) in
                if imageUrl == self.video!.channel!.profileImageName! {
                    self.userProfileImageView.image = image
                }
            }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " "
            let nsNumber = NSNumber(value: video!.numberOfViews!)
            subtitleTextView.text = "\(video!.channel!.name!) ・ \(numberFormatter.string(from: nsNumber)!) ・ 2 years ago"
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "KISS - Love Gun"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "KISSOfficialVideos ・ 502,354,871 views ・ 9 years age"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        textView.textColor = .gray
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
        return view
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        super.setupViews()
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(separatorView)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView, separatorView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-20-[v2(1)]|", views: thumbnailImageView, userProfileImageView,separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))

        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30))
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        userProfileImageView.image = nil
    }
    
}
