//
//  HomeViewController.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 05/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    let videos: [Video] = {
//        let kissChannel = Channel()
//        kissChannel.name = "KISSOfficial"
//        kissChannel.profileImageName = "kiss_profile"
//
//        let loveGunVideo = Video()
//        loveGunVideo.title = "KISS - Love Gun"
//        loveGunVideo.thumbnailImage = "kiss"
//        loveGunVideo.numberOfViews = 502_354_871
//        loveGunVideo.channel = kissChannel
//
//        let liveVideo = Video()
//        liveVideo.title = "Kiss. Live Concert in San Francisco at 2015"
//        liveVideo.thumbnailImage = "kiss_live"
//        liveVideo.numberOfViews = 138_925_529
//        liveVideo.channel = kissChannel
//
//        return [loveGunVideo, liveVideo]
//    }()
    
    var videos = [Video]()
    
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
        setupNavBarButtons()
        
        Dataservice.shared.downloadVideos { (videos) in
            self.videos = videos
            print(videos)
            self.collectionView.reloadData()
        }
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    private func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        
    }
    
    @objc func handleMore() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 20 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

