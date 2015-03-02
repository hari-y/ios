//
//  LogViewController.swift
//  swift-logger
//
//  Created by Hari  on 3/2/15.
//  Copyright (c) 2015 Pensersoft. All rights reserved.
//

import Foundation
import UIKit
class LogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logVerbose()
        logVerbose("This is verbose message")
        logDebug("This is debug message")
        logVerbose("Turn off DateTime")
        ZHLogShowDateTime = false
        logInfo("Now not date time is logged out")
        logError("I can use format: %d + %d = %d", args: 1, 1, 2)
        logInfo("Now turn off all")
        ZHLogShowFileName = false
        ZHLogShowLineNumber = false
        ZHLogShowFunctionName = false
        logWarning("This is a warning")
    }
}