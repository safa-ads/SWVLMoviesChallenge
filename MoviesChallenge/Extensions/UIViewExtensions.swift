

import UIKit

extension UIView {
    
    func addRoundedCorners(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    
    func addBorderColor(borderColor: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
    }
}

