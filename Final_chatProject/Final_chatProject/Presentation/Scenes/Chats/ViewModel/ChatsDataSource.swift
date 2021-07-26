//
//  ChatsDataSource.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class ChatsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var tableView: UITableView!
    private var viewModel: ChatsViewModelProtocol!
    private var coordinator: CoordinatorProtocol!

    
    init(with tableView: UITableView, viewModel: ChatsViewModelProtocol, coordinator: CoordinatorProtocol) {
        super.init()
        self.tableView = tableView
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(ChatsTableCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.proceedToMessaging()
    }
}
