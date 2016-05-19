//
//  ViewController.swift
//  DATN_Scale
//
//  Created by KhanhNguyen on 4/13/16.
//  Copyright © 2016 KhanhNguyen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private var _force: CGFloat = 0.0
    var force: CGFloat {get {return _force}}
    var maximumForce: CGFloat = 8.0
    @IBOutlet weak var gramLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let firstTouch = touches.first {
            if #available(iOS 9.2, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.Available {
                //Force touch is available.
                    Available in iOS 9.0 and later//
                    maximumForce = min(firstTouch.maximumPossibleForce, maximumForce)
                    if firstTouch.force >= maximumForce {
                        let max = (maximumForce/firstTouch.maximumPossibleForce) * 337
                        gramLabel.text = "\(max) grams"
                    } else {
                        let max = (maximumForce/firstTouch.maximumPossibleForce) * 337
                        let _force = firstTouch.force/maximumForce
                        let grams = _force * max
                        let roundGrams = Int(grams)
                        gramLabel.text = "\(roundGrams) grams"
                    }
                }
            }
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        gramLabel.text = " 0 gram"
    }
    
    
    
}
