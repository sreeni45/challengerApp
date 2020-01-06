//
//  CGRUtils.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/30/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionHandler = (([String: Any]?, Error?)) -> Void

class CGRUtils {
    class func dateFromString(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from:dateString)
        return date
    }
}

