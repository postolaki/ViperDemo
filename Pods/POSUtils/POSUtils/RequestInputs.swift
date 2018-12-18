import Alamofire

public struct RequestInputs {
    public let params: [String: Any]?
    public let url: URL
    public let method: Alamofire.HTTPMethod
    public let encoding: ParameterEncoding
    public var headers: HTTPHeaders?
    
    public init(params: [String: Any]? = nil,
                url: URL,
                method: Alamofire.HTTPMethod = .get,
                encoding: ParameterEncoding = JSONEncoding.default,
                headers: HTTPHeaders? = nil) {
        self.params = params
        self.url = url
        self.method = method
        self.encoding = encoding
        self.headers = headers
    }
}
