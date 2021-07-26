//
//  MessagingViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit
import MessageKit

class MessagingViewController: MessagesViewController, Storyboarded, CoordinatorDelegate {
    
    var coordinator: CoordinatorProtocol?
    
    private var messages = [Message]()
    
    private let daSender = Sender(photoUrl: "",
                                senderId: "1",
                                displayName: "gega palavandishvili")
    
    private var viewModel: MessagingViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpMessages()
        messages.append(Message(sender: daSender,
                                messageId: "momkalit",
                                sentDate: Date(),
                                kind: .text("pls kill mee")))
        messages.append(Message(sender: daSender,
                                messageId: "momkalit",
                                sentDate: Date(),
                                kind: .text("pls kill mee, gega mqvia agar vici raga vqna bicheeee")))

    }

}


extension MessagingViewController {
    func configureView() {
        viewModel = MessagingViewModel(with: self, coordinator: coordinator!)
    }

    func setUpMessages() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

extension MessagingViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    public func currentSender() -> SenderType {
        return daSender
    }
    
    public func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    public func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
