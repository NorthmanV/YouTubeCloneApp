//
//  Video.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 15/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct Video: Codable {
    var thumbnailImage: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    var channel: Channel?
    var duration: Int?
    
    enum CodingKeys: String, CodingKey {
        case thumbnailImage = "thumbnail_image_name"
        case title
        case numberOfViews = "number_of_views"
        case duration
        case channel
    }
}
