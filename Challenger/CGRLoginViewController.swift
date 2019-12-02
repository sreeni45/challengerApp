//  Converted to Swift 5.1 by Swiftify v5.1.26565 - https://objectivec2swift.com/
//
//  CGRLoginViewController.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/1/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class CGRLoginViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
        if AccessToken.current != nil {
            // User is logged in, do work such as go to next view controller.
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewSB") as? HomeViewController
            if let controller = controller {
                navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
