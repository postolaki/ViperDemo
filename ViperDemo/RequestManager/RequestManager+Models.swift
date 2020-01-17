import Foundation

extension RequestManager {
    enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    enum DataResult {
        case success(Data)
        case failure(Error?)
    }
    
    enum CodableResult<Model: Decodable> {
        case success(Model)
        case failure(Error?)
        
        var value: Model? {
            switch self {
            case .success(let model):
                return model
            case .failure:
                return nil
            }
        }
        
        var error: Error? {
            switch self {
            case .success:
                return nil
            case .failure(let error):
                return error
            }
        }
    }
}
