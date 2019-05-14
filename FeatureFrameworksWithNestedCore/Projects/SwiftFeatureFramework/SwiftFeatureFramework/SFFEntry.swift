//
//  SFFEntry.swift
//  SwiftFeatureFramework
//
//  Created by Abbey Jackson on 2019-05-03.
//  Copyright © 2019 abbeytest. All rights reserved.
//

import Foundation
import NestedCoreFramework

public class SFFEntry: NSObject {
    @objc public func swiftLabel() -> String {
        return NCFEntry().coreLabel("Swift")
    }
}
