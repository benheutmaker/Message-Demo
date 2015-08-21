//
//  Person.swift
//  Message Demo
//
//  Created by Benjamin Heutmaker on 8/20/15.
//  Copyright (c) 2015 Ben Heutmaker. All rights reserved.
//

import UIKit

class Person: NSObject {
   
    var username: String
    var profilePicture: UIImage
    
    init(username: String, profilePicture: UIImage) {
        self.username = username
        self.profilePicture = profilePicture
    }
}
