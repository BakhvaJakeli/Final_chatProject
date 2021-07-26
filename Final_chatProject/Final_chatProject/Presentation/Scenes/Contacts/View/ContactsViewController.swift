//
//  ContactsViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit

class ContactsViewController: BaseViewController {
    
    private var viewModel: ContactsViewModelProtocol?
    private var datasource: ContactsDataSource?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configureView()
        myTable.registerNib(class: ContactsCell.self)
    }

}

extension ContactsViewController: UISearchBarDelegate {
    
    func configureView() {
        viewModel = ContactsViewModel(with: self, coordinator: coordinator!)
        datasource = ContactsDataSource(with: myTable, viewModel: viewModel!, coordinator: coordinator!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
}
