//
//  MaterialView.swift
//  dreamlistener
//
//  Created by oscar ljungdahl on 2017-05-13.
//  Copyright © 2017 oskar ljungdahl. All rights reserved.
//

import UIKit
private var  materialKey = false

extension  UIView {
    @IBInspectable var materialDesign: Bool{
        get {
        
            return materialKey
        } set {
            
            materialKey = newValue
            
            
            if materialKey {
                
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 200/255, green:200/255, blue: 255/200, alpha: 0).cgColor
                
            } else{
                
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
        }
    }
}
 
