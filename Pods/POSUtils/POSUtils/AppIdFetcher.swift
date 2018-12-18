import Foundation

@objc public class AppIdFetcher: NSObject {
    public static var appId: Int = UserDefaults.standard.integer(forKey: "savedAppId")
    
    @objc public func getId(completion: @escaping (Int) -> Void) {
        if AppIdFetcher.appId != 0 {
            completion(AppIdFetcher.appId)
            return
        }
        
        guard let bundleId = Bundle.main.bundleIdentifier,
            let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(bundleId)") else {
            return
        }
        
        let inputs = RequestInputs(url: url)
        Request(inputs: inputs).requestJson(onSuccess: {[weak self] response in
            guard let dict = response as? [String: Any],
                let results = dict["results"] as? [Any],
                !results.isEmpty,
                let first = results[0] as? [String: Any],
                let appId = first["trackId"] as? Int,
                appId != 0 else {
                    return
            }
            AppIdFetcher.appId = appId
            self?.saveToDefaults(id: appId)
            completion(appId)
        }, onFailure: {_ in})
    }
    
    private func saveToDefaults(id: Int) {
        UserDefaults.standard.set(id, forKey: "savedAppId")
        UserDefaults.standard.synchronize()
    }
}
