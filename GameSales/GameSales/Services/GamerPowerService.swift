import Foundation

enum GamerPowerServiceError: Error {
    case nodata
}


protocol GamerPowerServiceProtocol {
    
    func fetchSales(callback: @escaping (RequestResult) -> Void)
    
}


struct GamerPowerService: GamerPowerServiceProtocol {
    
    let urlSession = URLSession.shared
    
    let fetchSalesUrl = URL(string: "https://www.gamerpower.com/api/giveaways?platform=steam")
    
    func fetchSales(callback: @escaping (RequestResult) -> Void) {
        
        guard let url = fetchSalesUrl else { return }
        
        let task = urlSession.dataTask(with: url) { (maybeData: Data?, maybeUrlResponse: URLResponse?, maybeError: Error?) in
            if let error = maybeError {
                let result = RequestResult.failure(error)
                callback(result)
                return
            }
            
            guard let data = maybeData else {
                let result = RequestResult.failure(GamerPowerServiceError.nodata)
                callback(result)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let data = try decoder.decode([GameDeal].self, from: data)
                let result = RequestResult.success(data)
                callback(result)
            } catch {
                
            }
            
        }
        
        task.resume()
    }
    
    
}


//func fetchSales() {
//    let url = URL(string: "https://www.gamerpower.com/api/giveaways?platform=steam")!
//    
//    let decoder = JSONDecoder()
//    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//        guard let data = data else { return }
//        //print(String(data: data, encoding: .utf8)!)
//        do {
//            let gameDeals = try decoder.decode([GameDeal].self, from: data)
//            
//            for deal in gameDeals {
//                print("Title: \(deal.title)")
//            }
//            
//        } catch {
//            print("[ERROR]: Failed to decode json: \(error)")
//        }
//        
//        
//        
//    }
//    
//    task.resume()
//}
