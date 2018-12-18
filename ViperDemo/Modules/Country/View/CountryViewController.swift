import UIKit
import POSUtils

final class CountryViewController: UIViewController, StoryboardInstantiable {
	static var storyboardName: String = "CountryViewController"
    var output: CountryViewOutput!
    private var dataManager = CountryDataManager()

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - CountryViewInput

extension CountryViewController: CountryViewInput {
	func setupInitialState() {
        tableView.register(cell: CountryCell.self)
    }
    
    func didReceiveCountry(_ country: CountryModel) {
        title = country.name
    }
    
    func reloadData(with countryViewModels: [CountryViewModel]) {
        dataManager.viewModels = countryViewModels
        tableView.delegate = dataManager
        tableView.dataSource = dataManager
        tableView.reloadData()
    }
}
