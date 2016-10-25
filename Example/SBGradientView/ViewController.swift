//
//  ViewController.swift
//  SBGradientView
//
//  Created by Steve Barnegren on 10/25/2016.
//  Copyright (c) 2016 Steve Barnegren. All rights reserved.
//

import UIKit
import SBGradientView

class ViewController: UIViewController {
    
    let gradientView = GradientView(direction: .fromTop, colors: [UIColor.red, UIColor.orange, UIColor.green, UIColor.blue])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradientView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.frame = view.bounds
    }

}

