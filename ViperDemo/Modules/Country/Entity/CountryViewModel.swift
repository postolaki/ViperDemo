import Foundation

enum CellType: String {
    case name
    case nativeName
    case capital
    case alpha2Code
    case alpha3Code
    case numericCode
    case region
    case subregion
    case population
    case area
    
    var title: String {
        switch self {
        case .name: return "Name"
        case .nativeName: return "Native Name"
        case .capital: return "Capital"
        case .alpha2Code: return "Alpha-2 code"
        case .alpha3Code: return "Alpha-3 code"
        case .numericCode: return "Numeric code"
        case .region: return "Region"
        case .subregion: return "Subregion"
        case .population: return "Population"
        case .area: return "Area"
        }
    }
}

struct CountryViewModel {
    let title: String
    let value: String
}
