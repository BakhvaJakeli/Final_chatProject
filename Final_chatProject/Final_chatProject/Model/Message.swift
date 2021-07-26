//
//  Message.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import Foundation
import MessageKit

struct Message: MessageType {
  
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
}

struct Sender: SenderType {
    
    var photoUrl: String
    
    var senderId: String
    
    var displayName: String
    
    
}
