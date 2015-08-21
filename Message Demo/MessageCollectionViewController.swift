//
//  MessageCollectionViewController.swift
//  Message Demo
//
//  Created by Benjamin Heutmaker on 8/20/15.
//  Copyright (c) 2015 Ben Heutmaker. All rights reserved.
//

import UIKit

class MessageCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let you = AppDelegate.appDelegate().you
    var thread: MessageThread!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let themProfileButton = UIBarButtonItem(image: UIImage(named: "icon-profile-1"), style: .Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = themProfileButton
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thread.messages.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let message = thread.messages[indexPath.row]
        
        if message.sender == you {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("YouMessageCell", forIndexPath: indexPath) as! YouMessageCell
            
            cell.messageView.layer.cornerRadius = 5
            
            cell.profilePictureView.image = you.profilePicture
            cell.profilePictureView.layer.cornerRadius = 5
            
            cell.textLabel.text = message.text
            cell.dateLabel.text = AppDelegate.appDelegate().formatDate(message.timeStamp)
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThemMessageCell", forIndexPath: indexPath) as! ThemMessageCell
            
            cell.messageView.layer.cornerRadius = 5
            
            cell.profilePictureView.image = message.sender.profilePicture
            cell.profilePictureView.layer.cornerRadius = 5
            
            cell.textLabel.text = message.text
            cell.dateLabel.text = AppDelegate.appDelegate().formatDate(message.timeStamp)
            
            return cell
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let width = UIScreen.mainScreen().bounds.width - 16
        let height = CGFloat(44)
        
        return CGSize(width: width, height: height)
    }
}