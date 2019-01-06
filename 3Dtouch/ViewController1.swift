//
//  ViewController1.swift
//  3Dtouch
//
//  Created by Berkin Ceylan on 25/12/18.
//  Copyright © 2018 Intern. All rights reserved.
//

import UIKit

class ViewController1: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIApplication.shared.keyWindow?.traitCollection.forceTouchCapability == UIForceTouchCapability.available
        {
            registerForPreviewing(with: self, sourceView: view)
            
        }
        
    }
}
extension ViewController1: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let convertedLocation = view.convert(location, to: imageView)
        
        if imageView.bounds.contains(convertedLocation) {
            let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") as! popViewController
            popVC.popImage = imageView.image!
            popVC.preferredContentSize = .zero
            previewingContext.sourceRect = imageView.frame
            
            return popVC
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if let ViewController = viewControllerToCommit as? popViewController{
            ViewController.back.isHidden = false
        }
        show(viewControllerToCommit, sender: self)
    }
}
