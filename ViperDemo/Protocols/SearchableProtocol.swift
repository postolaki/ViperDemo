import Foundation
import UIKit

protocol SearchableProtocol: class {
    func addSearchController(_ searchController: UISearchController, to tableView: UITableView)
}

extension SearchableProtocol where Self: UIViewController {
    func addSearchController(_ searchController: UISearchController, to tableView: UITableView) {
        setupSearchController(searchController)
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
            searchController.searchBar.sizeToFit()
        }
    }

    private func setupSearchController(_ searchController: UISearchController) {
        definesPresentationContext = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.accessibilityActivate()
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self as? UISearchBarDelegate
        searchController.searchBar.searchBarStyle = .default
        searchController.searchBar.tintColor = .darkGray
        searchController.searchBar.barTintColor = .darkGray
        searchController.hidesNavigationBarDuringPresentation = false
    }
}
