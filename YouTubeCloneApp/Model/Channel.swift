//
//  Channel.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 15/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct Channel: Codable {
    var name: String?
    var profileImageName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageName = "profile_image_name"
    }
}
