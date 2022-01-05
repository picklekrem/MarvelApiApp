//
//  Extensions.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 4.01.2022.
//

import Foundation
import UIKit

fileprivate var aView : UIView?

extension UIViewController {
    
    func showSpinner() {
        
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}

extension UIView {
    func cardView() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
}

extension UIImageView {
    
    func roundedImage() {
        self.backgroundColor = UIColor.black
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.white.cgColor
    }
}
