//
//  ViewController.swift
//  BlurApp
//
//  Created by Anton Tolstov on 27.01.2020.
//  Copyright © 2020 Anton Tolstov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundImageView:UIImageView!
    
    var blurEffectView: UIVisualEffectView?
    let imageSet = ["Istanbul", "Paris", "Rome"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: imageSet.randomElement()!)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        blurEffectView?.frame = view.bounds
    }
}

