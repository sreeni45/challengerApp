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

class HomeViewController : UIViewController, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var challengesCV: UICollectionView!
    @IBOutlet weak var challengeTV: UITableView!
    
    private var challenges: [Any] = []
    private var challengeComments: [Any] = []

    static var collectionViewNibMyCellloaded = false
    static let collectionViewCellIdentifier = "CGECell"
    static let challengeTextCommentCellIdentifier = "ChallengeTextCommentCell"
    
    override func viewDidLoad() {
        Challenge.getChallenges { challengesArr in
            self.challenges = challengesArr
//            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.challengesCV.reloadData()
            }
        }
        
        challengeComments = ["foo", "bar", "foobar", "foobarTest"]
        
//        challenges = ["foo", "bar", "boo"]
        challengesCV.dataSource = self
        challengeTV.dataSource = self
        challengeTV.delegate = self
        challengeTV.sectionHeaderHeight = UITableView.automaticDimension
//        challengeTV.contentInsetAdjustmentBehavior = .never
//        challengeTV.estimatedSectionHeaderHeight = 400

        let view = ChallengeHeaderView.instanceFromNib()
//        let size = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        let height = size.height
//        let width = size.width
//        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        var frame = view.frame
        frame.size.width = challengeTV.frame.size.width;
        view.frame = frame;

        view.setNeedsLayout()
        view.layoutIfNeeded();

        let height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height

        var headerFrame = view.frame;
        headerFrame.size.height = height;

        view.frame = headerFrame;
        challengeTV.tableHeaderView = view
        //        self.view.addSubview(view)
        challengeTV.register(UINib(nibName: "ChallengeHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: ChallengeHeaderView.reuseIdentifier)
        
        challengeTV.register(UINib(nibName: "ChallengeTextCommentCell", bundle: nil), forCellReuseIdentifier: HomeViewController.challengeTextCommentCellIdentifier)
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        if let headerView = challengeTV.tableHeaderView {
//
//            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//            var headerFrame = headerView.frame
//
//            //Comparison necessary to avoid infinite loop
//            if height != headerFrame.size.height {
//                headerFrame.size.height = height
//                headerView.frame = headerFrame
//                challengeTV.tableHeaderView = headerView
//            }
//        }
//    }
    
//    Challenges CV
    
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
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChallengeHeaderView.reuseIdentifier) as! ChallengeHeaderView
//
////        headerView.customLabel.text = content[section].name  // set this however is appropriate for your app's model
////        headerView.sectionNumber = section
////        headerView.delegate = self
////        headerView.autoresizingMask = []
//        return headerView
//    }
    
//    Challenge TVf
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challengeComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.challengeTextCommentCellIdentifier, for: indexPath) as? ChallengeTextCommentCell  else {
            fatalError("The dequeued cell is not an instance of ChallengeTextCommentCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let challengeComment = challengeComments[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
}
