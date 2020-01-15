//
//  ChallengeTextCommentView.swift
//  Challenger
//
//  Created by Sreeni Appasani on 1/11/20.
//  Copyright © 2020 Sreenivas Appasani. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class ChallengeTextCommentCell : UITableViewCell {
    
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var textContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let fb_user = AccessToken.current
//        let userId = [FBSDKAccessToken currentAccessToken]
        
    }
}
