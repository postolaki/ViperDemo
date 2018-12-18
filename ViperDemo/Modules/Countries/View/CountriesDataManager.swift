import UIKit

protocol CountriesDataManagerDelegate: class {
    func didSelectCountry(_ country: CountryModel)
}

final class CountriesDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var countries: [CountryModel]!
    weak var delegate: CountriesDataManagerDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesCell.identifier, for: indexPath) as! CountriesCell
        cell.setup(with: country)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        delegate?.didSelectCountry(country)
    }
}
