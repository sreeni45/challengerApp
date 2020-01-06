//
//  HomeViewController.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/1/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HomeViewController : UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var challengeCV: UICollectionView!
    
    private var challenges: [Any] = []

    override func viewDidLoad() {
        Challenge.getChallenges { challengesArr in
            self.challenges = challengesArr
//            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.challengeCV.reloadData()
            }
        }
//        challenges = ["foo", "bar", "boo"]
        challengeCV.dataSource = self
    }

    static var collectionViewNibMyCellloaded = false
    static let collectionViewCellIdentifier = "CGECell"

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if !HomeViewController.collectionViewNibMyCellloaded {
            let nib = UINib(nibName: "CGECollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: HomeViewController.collectionViewCellIdentifier)
            HomeViewController.collectionViewNibMyCellloaded = true
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewController.collectionViewCellIdentifier, for: indexPath) as? CGECollectionViewCell
        cell?.layoutIfNeeded()
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return challenges.count
    }
}
