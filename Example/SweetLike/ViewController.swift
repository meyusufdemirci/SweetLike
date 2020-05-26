//
//  ViewController.swift
//  SweetLike
//
//  Created by demirciy on 07/29/2019.
//  Copyright (c) 2019 demirciy. All rights reserved.
//

import UIKit
import SweetLike

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var sweetLikeButton: SweetLike!
    private let button: SweetLike = SweetLike(frame: CGRect(x: (UIScreen.main.bounds.width / 2) - 25, y: 50, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
    }
}
