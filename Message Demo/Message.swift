//
//  Message.swift
//  Message Demo
//
//  Created by Benjamin Heutmaker on 8/20/15.
//  Copyright (c) 2015 Ben Heutmaker. All rights reserved.
//

import UIKit

class Message: NSObject {
   
    var text: String
    var timeStamp: NSDate
    var sender: Person
    var reciever: Person
    
    init(text: String, timeStamp: NSDate, sender: Person, reciever: Person) {
        self.text = text
        self.timeStamp = timeStamp
        self.sender = sender
        self.reciever = reciever
    }
}
