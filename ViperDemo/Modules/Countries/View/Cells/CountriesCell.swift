import UIKit

class CountriesCell: UITableViewCell {
    
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var countryCapitalLabel: UILabel!
    
    func setup(with country: CountryModel) {
        countryNameLabel.text = country.name
        countryCapitalLabel.text = country.capital
    }
}
