//
//  Dataservice.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 17/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class Dataservice {
    static let shared = Dataservice()
    private init() {}
    
    func downloadVideos(completion: @escaping ([Video]) -> ()) {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let videos = try? JSONDecoder().decode([Video].self, from: data) {
                DispatchQueue.main.async {
                    completion(videos)
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(from imageUrl: String, completion: @escaping (UIImage) -> ()) {
        let url = URL(string: imageUrl)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
        task.resume()
    }
}