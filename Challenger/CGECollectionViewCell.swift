//  Converted to Swift 5.1 by Swiftify v5.1.26565 - https://objectivec2swift.com/
//
//  CGECollectionViewCell.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/1/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//
import Foundation
import UIKit

class CGECollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var testImg: UIImage? = nil
        if let url = URL(string: "https://challengerapp-assets.s3.amazonaws.com/testLogo.png"), let data = try? Data(contentsOf: url) {
            testImg = UIImage(data: data)
        }
        imgView.image = testImg
        imgView.sizeToFit()
    }
}
