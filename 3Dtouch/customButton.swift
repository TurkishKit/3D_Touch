//
//  customButton.swift
//  TurkishKit
//
//  Created by Berkin Ceylan on 25.12.2018.
//  Copyright © 2018 Intern. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
}
