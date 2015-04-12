//
//  ViewController.swift
//  FingerPrintAuthenticationExample
//
//  Created by Hari  on 4/11/15.
//  Copyright (c) 2015 McKesson. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testTouchId(sender: AnyObject) {
        
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
            error: &error) {
                
                // Device can use TouchID
                
                context.evaluatePolicy(
                    LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
                    localizedReason: "Access requires authentication",
                    reply: {(success, error) in
                        
                        if error != nil {
                            
                            switch error!.code {
                                
                            case LAError.SystemCancel.rawValue:
                                self.notifyUser("Session cancelled",
                                    err: error?.localizedDescription)
                                
                            case LAError.UserCancel.rawValue:
                                self.notifyUser("Please try again",
                                    err: error?.localizedDescription)
                                
                            case LAError.UserFallback.rawValue:
                                self.notifyUser("Authentication",
                                    err: "Password option selected")
                                // Custom code to obtain password here
                                
                            default:
                                self.notifyUser("Authentication failed", 
                                    err: error?.localizedDescription)
                            }
                            
                        } else {
                            self.notifyUser("Authentication Successful", 
                                err: "You now have full access")
                        }
                        
                })
                
        } else {
            // Device cannot use TouchID
            
                self.notifyUser("No touch id on device ",
                    err: "Pick a device where u  have  finger print scanning available")
        
            
            
        }
    }
    
    func notifyUser(msg: String, err: String?) {
        let alert = UIAlertController(title: msg,
            message: err,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "OK",
            style: .Cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true,
            completion: nil)
    }


}

