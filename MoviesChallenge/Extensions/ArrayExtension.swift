//
//  ArrayExtension.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/7/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

extension Array where Iterator.Element == Movies {
    
    mutating func sortByRate() {
        self.sort { (list1, list2) -> Bool in
            if let list1Rating = list1.rating, let list2Rating = list2.rating {
                return list1Rating > list2Rating
            }
            return false
        }
    }
}

