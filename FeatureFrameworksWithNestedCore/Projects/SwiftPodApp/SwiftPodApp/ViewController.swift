//
//  ViewController.swift
//  SwiftPodApp
//
//  Created by Abbey Jackson on 2019-05-02.
//  Copyright © 2019 abbeytest. All rights reserved.
//

import UIKit
import ObjcFeatureFramework
import SwiftFeatureFramework

class ViewController: UIViewController {

    @IBOutlet weak var swiftLabel: UILabel!
    @IBOutlet weak var objcLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let originalObjcLabel = objcLabel.text
        objcLabel.text = OFFEntry().objcLabel()
        if objcLabel.text != originalObjcLabel {
            objcLabel.backgroundColor = UIColor.green
        }

        let originalSwiftLabel = swiftLabel.text

        swiftLabel.text = SFFEntry().swiftLabel()
        if swiftLabel.text != originalSwiftLabel {
            swiftLabel.backgroundColor = UIColor.green
        }
    }
}

