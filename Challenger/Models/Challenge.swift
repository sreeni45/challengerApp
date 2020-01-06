//
//  CGRJsonChallenge.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/31/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

import Foundation
import Alamofire


struct Challenge {
    var name: String?
    var media_url: String?
    var description: String?
    var begin_at: Date?
    var end_at: Date?
}

extension Challenge {
    init?(json: [String: Any]) {
        guard let attributes = json["attributes"] as? [String: Any] else {
            return nil
        }
        guard let name = attributes["name"] as? String,
              let description = attributes["description"] as? String,
            let begin_at = CGRUtils.dateFromString(dateString: attributes["begin_at"] as! String),
            let end_at = CGRUtils.dateFromString(dateString: attributes["end_at"] as! String)
            else {
            return nil
        }

        
        guard let links = json["links"] as? [String: Any] else {
            return nil
        }
        let media_url = links["media_url"] as? String

        self.name = name
        self.media_url = media_url
        self.description = description
        self.begin_at = begin_at
        self.end_at = end_at
    }
    
    static func getChallenges(completion: @escaping ([Challenge]) -> Void) {
        AF.request("https://challengerapp.herokuapp.com/challenges", method: .get, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            var challenges: [Challenge] = []
                            if let json = value as? [String: Any] {
                                let challengesArr = json["data"] as! Array<Any>
                                for case let challengeJson in challengesArr {
                                    if let challenge = Challenge(json: challengeJson as! [String : Any]) {
                                        challenges.append(challenge)
                                    }
                                }
                            }
                            completion(challenges)
                        case .failure(let error):
                            print(error)
                        }
                }
    }
}

