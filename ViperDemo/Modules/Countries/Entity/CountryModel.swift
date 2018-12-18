import Foundation

struct CountryModel: Decodable {
    let name: String
    let alpha2Code: String
    let alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let region: String
    let subregion: String
    let population: Float
    let demonym: String
    let area: Float?
    let timezones: [String]
    let borders: [String]
    let nativeName: String
    let numericCode: String?
    let currencies: [Currency]
    let languages: [Language]
    let flag: URL
    let cioc: String?
}

struct Currency: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Decodable {
    let iso639_1: String?
    let iso639_2: String
    let name: String
    let nativeName: String
}
