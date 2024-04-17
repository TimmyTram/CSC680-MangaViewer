import Foundation


func fetchSales() {
    let url = URL(string: "https://www.gamerpower.com/api/giveaways?platform=steam")!
    
    let decoder = JSONDecoder()
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        //print(String(data: data, encoding: .utf8)!)
        do {
            let gameDeals = try decoder.decode([GameDeal].self, from: data)
            
            for deal in gameDeals {
                print("Title: \(deal.title)")
            }
            
        } catch {
            print("[ERROR]: Failed to decode json: \(error)")
        }
        
        
        
    }
    
    task.resume()
}
