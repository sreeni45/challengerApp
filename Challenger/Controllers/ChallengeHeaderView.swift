//
//  ChallengeHeaderView.swift
//  Challenger
//
//  Created by Sreeni Appasani on 1/10/20.
//  Copyright © 2020 Sreenivas Appasani. All rights reserved.
//

import Foundation
import UIKit

class ChallengeHeaderView : UIView {
    static let reuseIdentifier = "ChallengeHeader"
    
//    @IBOutlet weak var descriptionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionText: UILabel!
    
    class func instanceFromNib() -> UIView {
        let nib = UINib(nibName: "ChallengeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
        return nib
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setNeedsLayout();
        layoutIfNeeded();

    }
}
