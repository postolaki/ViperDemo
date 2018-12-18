import Foundation

final class CountryDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var viewModels: [CountryViewModel]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as! CountryCell
        cell.setup(with: viewModel)
        
        return cell
    }
}
