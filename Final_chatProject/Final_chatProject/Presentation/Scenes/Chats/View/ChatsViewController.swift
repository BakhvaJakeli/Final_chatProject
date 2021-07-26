//
//  ChatsViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit

class ChatsViewController: BaseViewController {

    private var viewModel: ChatsViewModelProtocol?
    private var dataSource: ChatsDataSource?
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        configureView()
    }

}


extension ChatsViewController {
    func setUpTable() {
        myTable.registerNib(class: ChatsTableCell.self)
    }
    
    func configureView() {
        viewModel = ChatsViewModel(with: self, coordinator: coordinator!)
        dataSource = ChatsDataSource(with: myTable, viewModel: viewModel!, coordinator: coordinator!)
        
    }
}
