//
//  MasterViewController.swift
//  Message Demo
//
//  Created by Benjamin Heutmaker on 8/20/15.
//  Copyright (c) 2015 Ben Heutmaker. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    //'you' Player object lives in the AppDelegate so it can be accessed from anywhere.
    let you = AppDelegate.appDelegate().you
    
    //Obviously you'd want to download this data from somewhere...
    let them = Person(username: "Them", profilePicture: UIImage(named: "them")!)
    let theOtherThem = Person(username: "The Other Them", profilePicture: UIImage(named: "otherThem")!)
    
    //This data too, should be downloaded from somewhere...
    var threads: [MessageThread] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        threads.append(MessageThread(
            messages: [ Message(text: "What's up?", timeStamp: NSDate(), sender: you, reciever: them),
                        Message(text: "Nothin much", timeStamp: NSDate(), sender: them, reciever: you),
                        Message(text: "That's cool", timeStamp: NSDate(), sender: you, reciever: them),
                        Message(text: "Yeah", timeStamp: NSDate(), sender: them, reciever: you) ],
            you: you, them: them))
        
        threads.append(MessageThread(
            messages: [ Message(text: "How're you?", timeStamp: NSDate(), sender: you, reciever: theOtherThem),
                        Message(text: "I'm good thanks", timeStamp: NSDate(), sender: theOtherThem, reciever: you),
                        Message(text: "Just got home", timeStamp: NSDate(), sender: theOtherThem, reciever: you),
                        Message(text: "Good I'm glad :)", timeStamp: NSDate(), sender: you, reciever: theOtherThem) ], 
            you: you, them: theOtherThem))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageThreadCell") as! MessageThreadCell
        
        let thread = threads[indexPath.row]
        
        cell.profilePictureView.image = thread.them.profilePicture
        cell.usernameLabel.text = thread.them.username
        cell.messagePreviewLabel.text = thread.messages[0].text
        cell.timeStampLabel.text = AppDelegate.appDelegate().formatDate(thread.messages[0].timeStamp)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let thread = threads[indexPath.row]
        performSegueWithIdentifier("detailSegue", sender: thread)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destinationViewController as! MessageCollectionViewController
            detailVC.thread = sender as! MessageThread
        }
    }

}
