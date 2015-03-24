//
//  ViewController.swift
//  SwiftConcurrencyExample
//
//  Created by Hari  on 3/24/15.
//  Copyright (c) 2015 McKesson. All rights reserved.
//

/*
Main queue
This queue performs all its tasks on the main thread, which is where Cocoa and
Cocoa Touch require programmers to call all UI-related methods. Use the dis
patch_get_main_queue function to retrieve the handle to the main queue.
Concurrent queues
These are queues that you can retrieve from GCD in order to execute asynchronous
or synchronous tasks. Multiple concurrent queues can execute multiple tasks in
parallel without breaking a sweat. No more thread management—yippee! Use the
dispatch_get_global_queue function to retrieve the handle to a concurrent
queue.
Serial queues
These are queues that, no matter whether you submit synchronous or asynchronous
tasks to them, will always execute their tasks in a first-in-first-out (FIFO) fashion,
meaning that they can only execute one block object at a time. However, they do
not run on the main thread and therefore are perfect for a series of tasks that have
to be executed in strict order without blocking the ui*/

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nonUiGlobalSortNumberView: UITextView!
    @IBOutlet weak var mainGlobalImageView: UIImageView!
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func uiMainAsync(sender: AnyObject) {
    
   
    //Change this to sync deadlock
    dispatch_async(dispatch_get_main_queue(), {[weak self] in
        //Everything runs in the main thread
        println("Current thread = \(NSThread.currentThread())")
        println("Main thread = \(NSThread.mainThread())")
        let alertController = UIAlertController(title: "GCD",
        message: "GCD is amazing!",
        preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK",
        style: .Default,
        handler: nil))
        self!.presentViewController(alertController,
        animated: true,
        completion: nil)
        })
    }
   
    @IBAction func restAsyncSync(sender: AnyObject) {
        let dispatchQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(dispatchQueue, {
        /* Replace this URL with the URL of a file that is
        rather big in size */
        let urlAsString = "http://www.apple.com"
        let url = NSURL(string: urlAsString)
        let urlRequest = NSURLRequest(URL: url!)
        let queue = NSOperationQueue()
        var error: NSError?
        let data = NSURLConnection.sendSynchronousRequest(urlRequest,
        returningResponse: nil,
        error: &error)
        if data != nil && error == nil{
        /* Date came back */
    }
        else if data!.length == 0 && error == nil{
        /* No data came back */
    }
        else if error != nil{
        /* Error happened. Make sure you handle this properly. */
        }
        })
        
    }
    @IBAction func mainGlobalsyncAsyncSort(sender: AnyObject) {
        
        let concurrentQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        /* If we have not already saved an array of 10,000
        random numbers to the disk before, generate these numbers now
        and then save them to the disk in an array */
        dispatch_async(concurrentQueue, {[weak self] in
        println("Current thread = \(NSThread.currentThread())")
        println("Main thread = \(NSThread.mainThread())")
        let numberOfValuesRequired = 10000
        if self!.hasFileAlreadyBeenCreated() == false{
        dispatch_sync(concurrentQueue, {
        var arrayOfRandomNumbers = [Int]()
        for _ in 0..<numberOfValuesRequired{
        let randomNumber = Int(arc4random())
        arrayOfRandomNumbers.append(randomNumber)
        }
        /* Now let's write the array to disk */
        let array = arrayOfRandomNumbers as NSArray
        array.writeToFile(self!.fileLocation()!, atomically: true)
    })
}
var randomNumbers: NSMutableArray?
/* Read the numbers from disk and sort them in an
ascending fashion */
dispatch_sync(concurrentQueue, {
        /* If the file has been created, we have to read it */
        if self!.hasFileAlreadyBeenCreated(){
        randomNumbers = NSMutableArray(
        contentsOfFile: self!.fileLocation()!)
        /* Now sort the numbers */
        randomNumbers!.sortUsingComparator({
        (obj1: AnyObject!, obj2: AnyObject!) -> NSComparisonResult in
        let number1 = obj1 as NSNumber
        let number2 = obj2 as NSNumber
        return number1.compare(number2)
        })
        }
        })
dispatch_async(dispatch_get_main_queue(), {
        if let numbers = randomNumbers{
        if numbers.count > 0{
        /* Refresh the UI here using the numbers in the
        randomNumbers array */
        self!.nonUiGlobalSortNumberView.scrollEnabled=true
        self!.nonUiGlobalSortNumberView.text="\(numbers)"
    } else {
        println("The numbers array is emtpy")
        }
        }
        })
})
    }
    @IBAction func uiMainGlobalAsyncSync(sender: AnyObject) {
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue, {[weak self] in
        var image: UIImage?
        dispatch_sync(queue, {
        /* Download the image here */
        /* Put your own URL here */
        let urlAsString = "http://placehold.it/120x120/0000ff&text=image4"
        let url = NSURL(string: urlAsString)
        let urlRequest = NSURLRequest(URL: url!)
        var downloadError: NSError?
        let imageData = NSURLConnection.sendSynchronousRequest(urlRequest,
        returningResponse: nil, error: &downloadError)
        if let error = downloadError{
        println("Error happened = \(error)")
    } else {
        if imageData?.length > 0{
        image = UIImage(data: imageData!)
        /* Now we have the image */
    } else {
        println("No data could get downloaded from the URL")
        }
        }
        })//end first dispatch sync
        dispatch_sync(dispatch_get_main_queue(), {
        /* Show the image to the user here on the main queue */
        
        if let theImage = image{
        self!.mainGlobalImageView.image=image
        }
        })
        })
    }
    
    
    @IBAction func mainAsyncGroupTasks(sender: AnyObject) {
            let taskGroup = dispatch_group_create()
            let mainQueue = dispatch_get_main_queue()
            /* Reload the table view on the main queue */
            dispatch_group_async(taskGroup, mainQueue, {[weak self] in
            println(__FUNCTION__)
            });
            /* Reload the scroll view on the main queue */
            dispatch_group_async(taskGroup, mainQueue, {[weak self] in
            println(__FUNCTION__)
            });
            /* Reload the image view on the main queue */
            dispatch_group_async(taskGroup, mainQueue, {[weak self] in
            println(__FUNCTION__)
            });
            /* When we are done, dispatch the following block */
            dispatch_group_notify(taskGroup, mainQueue, {[weak self] in
            /* Do some processing here */
            let controller = UIAlertController(title: "Finished",
            message: "All tasks are finished",
            preferredStyle: .Alert)
            controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
            self!.presentViewController(controller, animated: true, completion: nil)
            });
    }
    
    
    @IBAction func nonUiGlobalSync(sender: AnyObject) {
        //see we are using same queue other wise both call might get executed concurrently. Every thing runs on main threas as sync calls
        //GCD makes the decision whether to use the main thread
        /*    let delayInSeconds = 2.0
            let delayInNanoSeconds =
            dispatch_time(DISPATCH_TIME_NOW,
            Int64(delayInSeconds * Double(NSEC_PER_SEC)))
            dispatch_after(delayInNanoSeconds, queue, {
            }*/
            
/*dispatch_once always executes its task on the current queue being
used by the code that issues the call, be it a serial queue, a concurrent
queue, or the main queue.
var token: dispatch_once_t = 0
var numberOfEntries = 0
func executedOnlyOnce(){
numberOfEntries++;
println("Executed \(numberOfEntries) time(s)")
}
dispatch_once(&token, executedOnlyOnce)
dispatch_once(&token, executedOnlyOnce)
*/
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_sync(queue, printFrom1To1000)
        dispatch_sync(queue, printFrom1To1000)
    }
    
    
    @IBAction func restAsync(sender: AnyObject) {
            let urlAsString = "http://www.apple.com"
            let url = NSURL(string: urlAsString)
            let urlRequest = NSURLRequest(URL: url!)
            let queue = NSOperationQueue()
            NSURLConnection.sendAsynchronousRequest(urlRequest,
            queue: queue,
            completionHandler: {(response: NSURLResponse!,
            data: NSData!,
            error: NSError!) in
            if data.length > 0 && error == nil{
            /* Date did come back */
        }
            else if data.length == 0 && error == nil{
            /* No data came back */
        }
            else if error != nil{
            /* Error happened. Make sure you handle this properly */
            }
            })
    }
    
    @IBAction func restSync(sender: AnyObject) {
            let urlAsString = "http://www.apple.com"
            let url = NSURL(string: urlAsString)
            let urlRequest = NSURLRequest(URL: url!)
            let queue = NSOperationQueue()
            var error: NSError?
            let data = NSURLConnection.sendSynchronousRequest(urlRequest,
            returningResponse: nil,
            error: &error)
            if data != nil && error == nil{
            /* Date did come back */
        }
            else if data!.length == 0 && error == nil{
            /* No data came back */
        }
            else if error != nil{
            /* Error happened. Make sure you handle this properly */
            }
    }
    @IBAction func simpleOperation(sender: AnyObject) {
            let operation = CountingOperation()
            let operationQueue = NSOperationQueue()
            operationQueue.addOperation(operation)
    }
    
    
    @IBAction func dependencyOperation(sender: AnyObject) {
            let operation = DependencyOperation()
            let operationQueue = NSOperationQueue()
            operationQueue.addOperation(operation)
    }
    
    func printFrom1To1000(){
            for counter in 0..<1000{
            println("Counter = \(counter) - Thread = \(NSThread.currentThread())")
            }
    }
   
    func fileLocation() -> String?{
    /* Get the document folder(s) */
    let folders = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask,
            true) as [String]
    /* Did we find anything? */
    if folders.count == 0{
    return nil
    }
    /* Get the first folder */
    let documentsFolder = folders[0]
    /* Append the filename to the end of the documents path */
    return documentsFolder.stringByAppendingPathComponent("list.txt")
}
func hasFileAlreadyBeenCreated() -> Bool{
            let fileManager = NSFileManager()
            if let theLocation = fileLocation(){
            return fileManager.fileExistsAtPath(theLocation)
            }
            return false
}
}

