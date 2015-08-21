//
//  MessageThread.swift
//  Message Demo
//
//  Created by Benjamin Heutmaker on 8/20/15.
//  Copyright (c) 2015 Ben Heutmaker. All rights reserved.
//

import UIKit

class MessageThread: NSObject {
   
    var messages: [Message]
    var you: Person
    var them: Person
    
    init(messages: [Message], you: Person, them: Person) {
        self.messages = messages
        self.you = you
        self.them = them
    }
    
}
