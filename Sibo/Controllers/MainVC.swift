//
//  MainVC.swift
//  Sibo
//
//  Created by Abdul on 01/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let imageArray = [UIImage(named: "coin-button-1"),UIImage(named: "coin-button-7")]
    
    @IBOutlet weak var imageview: UIImageView!
    

    var value = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         animateimage()
    }
    
    func animateimage()
    {
//
//        value = value + 2.0
////        if value == 0.0
////        {
////
////            value = 1.0
////        }
////        else
////        {
////            value = 0.0
////        }
//        print(value)
//
//            var rotationAndPerspectiveTransform:CATransform3D = CATransform3DIdentity
//            rotationAndPerspectiveTransform.m34 = 1.0 / -1000.0;
//            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(M_PI * value), 0.0, 1.0, 0.0);
////            UIView.animate(withDuration: 3) {
////                //self.imageview.layer.anchorPoint = CGPoint(x: 0.5, y: 0);
////                self.imageview.layer.transform = rotationAndPerspectiveTransform;
////            }
//        UIView.animate(withDuration: 3, animations: {
//            self.imageview.layer.transform = rotationAndPerspectiveTransform;
//        }) { (bool) in
//            if bool{
//
//
//            self.animateimage()
//            }
//        }
        
        
        imageview.animationImages = imageArray as! [UIImage]
        imageview.animationDuration = 0.9
        imageview.startAnimating()
       
    
          imageview.rotate()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
         rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
        
//        let rotationz : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotationz.toValue = NSNumber(value: Double.pi * 2)
//        print(NSNumber(value: Double.pi * 2))
//        rotationz.duration = 1
//        rotationz.isCumulative = true
//        rotationz.repeatCount = Float.greatestFiniteMagnitude
//        self.layer.add(rotationz, forKey: "rotationAnimationz")
    }
}
