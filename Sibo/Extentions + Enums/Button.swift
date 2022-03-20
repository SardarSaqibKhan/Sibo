import UIKit
extension UIButton
{
    func shine()
    {
        self.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.2509803922, blue: 0.9960784314, alpha: 1)
        self.shadowColor = #colorLiteral(red: 0.3921568627, green: 0.2509803922, blue: 0.9960784314, alpha: 1)
        self.shadowOffset = CGSize(width: 4, height: 4)
        self.shadowOpacity = 0.5
    }
}

