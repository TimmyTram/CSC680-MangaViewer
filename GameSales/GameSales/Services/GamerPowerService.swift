import Foundation

enum GamerPowerServiceError: Error {
    case nodata
}


protocol GamerPowerServiceProtocol {
    func fetchSales(callback: @escaping (Loadable<[GameDeal]>) -> Void)
}


struct GamerPowerService: GamerPowerServiceProtocol {
    
    let urlSession = URLSession.shared
    
    let fetchSalesUrl = URL(string: "https://www.gamerpower.com/api/giveaways")
    
    func fetchSales(callback: @escaping (Loadable<[GameDeal]>) -> Void) {
        
        guard let url = fetchSalesUrl else { return }
        
        let task = urlSession.dataTask(with: url) { (maybeData: Data?, maybeUrlResponse: URLResponse?, maybeError: Error?) in
            if let error = maybeError {
                let result = Loadable<[GameDeal]>.failure(error)
                callback(result)
                return
            }
            
            guard let data = maybeData else {
                let result = Loadable<[GameDeal]>.failure(GamerPowerServiceError.nodata)
                callback(result)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let data = try decoder.decode([GameDeal].self, from: data)
                let result = Loadable<[GameDeal]>.success(data)
                callback(result)
            } catch {
                
            }
            
        }
        
        task.resume()
    }
    
    
}
