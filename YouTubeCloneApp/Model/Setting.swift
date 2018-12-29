//
//  Setting.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 23/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct Setting {
    let name: SettingName
    let imageName: String
}

enum SettingName: String {
    case settings = "Settings"
    case termsAndPrivacyPolicy = "Terms & Privacy Policy"
    case sendFeedback = "Send Feedback"
    case help = "Help"
    case switchAccount = "Switch Account"
    case cancel = "Cancel"
}
