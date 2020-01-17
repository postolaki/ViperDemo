import Foundation

final class RequestManager {
    
    var url: URL
    var urlRequest: URLRequest
    var task: URLSessionDataTask?
    
    init(url: URL) {
        self.url = url
        urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
    }
    
    init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
        guard let url = urlRequest.url else { fatalError("please set the url in URLRequest") }
        self.url = url
    }
    
    func makeRequest(completionHandler: @escaping (DataResult) -> Void) {
        task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        })
        task?.resume()
    }
    
    func makeCodableRequest<Model: Decodable>(completionHandler: @escaping (CodableResult<Model>) -> Void) {
        makeRequest { result in
            switch result {
            case .success(let data):
                guard let model = try? JSONDecoder().decode(Model.self, from: data) else {
                    completionHandler(.failure(nil))
                    return
                }
                completionHandler(.success(model))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func cancelRequest() {
        task?.cancel()
    }
}
