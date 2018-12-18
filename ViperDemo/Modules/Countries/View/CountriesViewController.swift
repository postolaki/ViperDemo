import UIKit
import POSUtils
import MBProgressHUD

final class CountriesViewController: UIViewController, StoryboardInstantiable, SearchableProtocol {
	static var storyboardName: String = "CountriesViewController"
    var output: CountriesViewOutput!
    private var dataManager = CountriesDataManager()
    private let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - CountriesViewInput

extension CountriesViewController: CountriesViewInput {
	func setupInitialState() {
        title = "Conutries"
        tableView.register(cell: CountriesCell.self)
        let searchProtocol: SearchableProtocol = self
        searchProtocol.addSearchController(searchController, to: tableView)
    }
    
    func reloadWith(countries: [CountryModel]) {
        dataManager.countries = countries
        tableView.delegate = dataManager
        tableView.dataSource = dataManager
        dataManager.delegate = self
        tableView.reloadData()
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}

// MARK: - CountriesDataManagerDelegate

extension CountriesViewController: CountriesDataManagerDelegate {
    func didSelectCountry(_ country: CountryModel) {
        output.didSelectCountry(country)
    }
}

// MARK: - UISearchBarDelegate

extension CountriesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        output.resetSearch()
        searchController.isActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        output.searchBy(name: text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.searchBy(name: searchText)
    }
}
