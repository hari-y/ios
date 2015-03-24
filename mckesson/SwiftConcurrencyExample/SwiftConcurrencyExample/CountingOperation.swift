//
//  CountingOperation.swift
//  SwiftConcurrencyExample
//
//  Created by Hari  on 3/24/15.
//  Copyright (c) 2015 McKesson. All rights reserved.
//

import Foundation
import UIKit

class CountingOperation:NSOperation{

    var startingCount: Int = 0
    var endingCount: Int = 0
    init(startCount: Int, endCount: Int){
        startingCount = startCount
        endingCount = endCount
    }
    convenience override init(){
        self.init(startCount: 0, endCount: 3)
    }

override func main() {
    var isTaskFinished = false
    while isTaskFinished == false &&
    self.finished == false{
    for counter in startingCount..<endingCount{
    println("Count = \(counter)")
    println("Current thread = \(NSThread.currentThread())")
    println("Main thread = \(NSThread.mainThread())")
    println("---------------------------------")
    }
    isTaskFinished = true
    }
}

}