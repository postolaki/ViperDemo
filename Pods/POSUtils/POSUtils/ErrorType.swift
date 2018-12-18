public enum ErrorType: Error, CustomNSError {
    case undefined
    case connection
    case request(Error?)
    case responseParse
    
    public var message: String {
        switch self {
        case .undefined: return "Something went wrong."
        case .responseParse: return "Wrong data format."
        case .request(let error): return error?.localizedDescription ?? "Something went wrong."
        case .connection: return "Seems you don't have internet connection."
        }
    }
}

public class CustomError {
    public let error: Error
    public let nsError: NSError
    
    public init(with localizedDescription: String) {
        nsError = NSError(domain: "app domain", code: -897, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
        error = nsError as Error
    }
}
