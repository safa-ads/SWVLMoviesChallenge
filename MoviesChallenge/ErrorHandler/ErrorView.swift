//
//  ErrorView.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    private static var shared = ErrorView(frame: UIScreen.main.bounds)
    var buttonRadius:CGFloat = 12.5
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    public class func getSharedInstance() -> ErrorView {
        ErrorView.shared.setView()
        return ErrorView.shared
    }
    
    func setView() {
        Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil)
        contentview.frame = self.frame
        contentview.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setButtonView()
    }
    
    func setButtonView() {
        okButton.backgroundColor = UIColor.TreePoppy
        okButton.addRoundedCorners(radius: buttonRadius)
    }
    
    func show() {
        UIApplication.shared.keyWindow!.addSubview(self)
        UIApplication.shared.keyWindow!.bringSubviewToFront(self)
    }
    
    func remove() {
        self.removeFromSuperview()
    }
    
    @IBAction func okButtonClicked(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
