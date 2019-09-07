//
//  NoResultView.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/7/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class NoResultView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setView() {
        Bundle.main.loadNibNamed("NoResultView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        errorMessageLabel.text = "No movies found"
    }
}
