//
//  ViewController.swift
//  ShiftLoggerDemo
//
//  Created by Hari  on 3/2/15.
//  Copyright (c) 2015 McKesson. All rights reserved.
//

import UIKit
import Swell
import XCGLogger

class ViewController: UIViewController {
 let swellLogger = Swell.getLogger("ViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func createZHLog(sender: AnyObject) {
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
    
    @IBAction func createSwellLog(sender: AnyObject) {
       // Swell.disableLogging();
        swellLogger.info("Named logger for Swell with controller name");
        Swell.info("Default logger that does use static calls  ");
        swellLogger.info {
            let closureName = "My Closure";
            return "Testing Closure name "+closureName;
        }
    }
    
    
    @IBAction func createXCGLogger(sender: AnyObject) {
        xcgLogger.verbose("A verbose message, usually useful when working on a specific problem");
        xcgLogger.debug("A debug message")
        xcgLogger.info("An info message, probably useful to power users looking in console.app");
        xcgLogger.warning("A warning message, may indicate a possible error")
        xcgLogger.error("An error occurred, but it's recoverable, just info about what happened");
        xcgLogger.severe("A severe error occurred, we are likely about to crash now");
        
    }
    
}

