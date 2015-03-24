//
//  DependencyOperation.swift
//  SwiftConcurrencyExample
//
//  Created by Hari  on 3/24/15.
//  Copyright (c) 2015 McKesson. All rights reserved.
//

import Foundation
import UIKit

class DependencyOperation:NSOperation{
    
    func performWorkForParameter(param: AnyObject?, operationName: String){
        if let theParam: AnyObject = param{
        println("First operation - Object = \(theParam)")
        }
        println("\(operationName) Operation - " +
        "Main Thread = \(NSThread.mainThread())")
        println("\(operationName) Operation - " +
        "Current Thread = \(NSThread.currentThread())")
        return
    }
    func firstOperationEntry(param: AnyObject?){
        performWorkForParameter(param, operationName: "First")
    }
    func secondOperationEntry(param: AnyObject?){
        performWorkForParameter(param, operationName: "Second")
    }
    
    override func main() {
            let firstNumber = 111
            let secondNumber = 222
            let firstOperation = NSBlockOperation {[weak self] () -> Void in
            if let strongSelf = self{
            strongSelf.firstOperationEntry(firstNumber)
            }
            }
            let secondOperation = NSBlockOperation {[weak self] () -> Void in
            if let strongSelf = self{
            strongSelf.secondOperationEntry(secondNumber)
            }
            }
            let operationQueue = NSOperationQueue()
            firstOperation.addDependency(secondOperation)
           
            operationQueue.addOperation(secondOperation)
             operationQueue.addOperation(firstOperation)
            println("Main thread is here")
            
    }

}

