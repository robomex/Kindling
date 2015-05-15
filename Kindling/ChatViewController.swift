//
//  ChatViewController.swift
//  Kindling
//
//  Created by Tony Morales on 5/11/15.
//  Copyright (c) 2015 Tony Morales. All rights reserved.
//

import Foundation

class ChatViewController: JSQMessagesViewController {
    
    var messages: [JSQMessage] = []
    
    var matchID: String?
    
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.senderId = currentUser()!.id
        self.senderDisplayName = currentUser()!.name
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        
        if let id = matchID {
            fetchMessages(id, {
                messages in
                
                for m in messages {
                    self.messages.append(JSQMessage(senderId: m.senderID, senderDisplayName: m.senderID, date: m.date, text: m.message))
                }
                self.finishReceivingMessage()
            })
        }
    }
    
    func sendersDisplayName() -> String! {
        return currentUser()!.name
    }
    
    func sendersId() -> String! {
        return currentUser()!.id
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        
        var data = self.messages[indexPath.row]
        return data
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        var data = self.messages[indexPath.row]
        if data.senderId == PFUser.currentUser()!.objectId {
            return outgoingBubble
        } else {
            return incomingBubble
        }
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        // may have to add an 's' here to senderSId and senderSDisplayName
        let m = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        
        self.messages.append(m)
        if let id = matchID {
            saveMessage(id, Message(message: text, senderID: senderId, date: date))
        }
        
        finishSendingMessage()
    }
}