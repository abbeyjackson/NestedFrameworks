//
//  ViewController.swift
//  SwiftPodApp
//
//  Created by Abbey Jackson on 2019-05-02.
//  Copyright © 2019 abbeytest. All rights reserved.
//

import UIKit
import CoreFramework

class ViewController: UIViewController {

    @IBOutlet weak var coreLabel: UILabel!
    @IBOutlet weak var nestedSwiftLabel: UILabel!
    @IBOutlet weak var nestedObjcLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let originalCoreLabel = coreLabel.text
        coreLabel.text = CFEntry().coreLabel()
        if coreLabel.text != originalCoreLabel {
            coreLabel.backgroundColor = UIColor.green
        }

        let originalNestedObjcLabel = nestedObjcLabel.text
        nestedObjcLabel.text = CFEntry().nestedObjcLabel()
        if nestedObjcLabel.text != originalNestedObjcLabel {
            nestedObjcLabel.backgroundColor = UIColor.green
        }

        let originalNestedSwiftLabel = nestedSwiftLabel.text
        nestedSwiftLabel.text = CFEntry().nestedSwiftLabel()
        if nestedSwiftLabel.text != originalNestedSwiftLabel {
            nestedSwiftLabel.backgroundColor = UIColor.green
        }
    }

}

