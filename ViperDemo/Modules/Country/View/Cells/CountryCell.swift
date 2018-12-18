import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    func setup(with countryViewModel: CountryViewModel) {
        titleLabel.text = "\(countryViewModel.title):"
        valueLabel.text = countryViewModel.value
    }
}
