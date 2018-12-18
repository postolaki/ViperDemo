import Alamofire

open class Request {
    private let inputs: RequestInputs
    
    @discardableResult
    public required init(inputs: RequestInputs) {
        self.inputs = inputs
    }
    
    static public var isReachable: Bool {
        return (NetworkReachabilityManager()?.isReachable) ?? false
    }
    
    open func requestString(onSuccess: @escaping (String) -> Void,
                            onFailure: @escaping (ErrorType) -> Void) {
        if !Request.isReachable {
            onFailure(.connection)
            return
        }
        
        dataRequest.responseString(encoding: .utf8, completionHandler: { response in
            switch response.result {
            case .success:
                guard let value = response.value else {
                    onFailure(.responseParse)
                    return
                }
                onSuccess(value)
            case .failure: onFailure(.request(response.error))
            }
        })
    }
    
    open func requestJson(onSuccess: @escaping (Any) -> Void,
                          onFailure: @escaping (ErrorType) -> Void) {
        if !Request.isReachable {
            onFailure(.connection)
            return
        }
        
        dataRequest.responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                guard let value = response.value else {
                    onFailure(.responseParse)
                    return
                }
                onSuccess(value)
            case .failure: onFailure(.request(response.error))
            }
        })
    }
    
    open func requestData(onSuccess: @escaping (Data) -> Void,
                          onFailure: @escaping (ErrorType) -> Void) {
        if !Request.isReachable {
            onFailure(.connection)
            return
        }
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let data = response.value else {
                    onFailure(.responseParse)
                    return
                }
                onSuccess(data)
            case .failure: onFailure(.request(response.error))
            }
        }
    }
    
    open func requestModel<Model: Decodable>(onSuccess: @escaping (Model) -> Void,
                                             onFailure: @escaping (ErrorType) -> Void) {
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let data = response.value else { return onFailure(.responseParse) }
                do {
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    onSuccess(result)
                } catch {
                    onFailure(.request(error))
                }
            case .failure: onFailure(.request(response.error))
            }
        }
    }
    
    open func cancel() {
        dataRequest.cancel()
    }
    
    private lazy var dataRequest: DataRequest = {
        return Alamofire.request(inputs.url,
                                 method: inputs.method,
                                 parameters: inputs.params,
                                 encoding: inputs.encoding,
                                 headers: inputs.headers)
    }()
}
