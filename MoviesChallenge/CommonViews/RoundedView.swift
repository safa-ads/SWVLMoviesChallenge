//
//  RoundedView.swift
//  MoviesDlc
//
//  Created by Safa Ads on 7/18/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

@IBDesignable class RoundedView: UIView {

    @IBInspectable
    var radius: CGFloat = 0{
        didSet{
            self.addRoundedCorners(radius: self.radius)
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear{
        didSet{
            self.addBorderColor(borderColor: self.borderColor)
        }
    }
}
