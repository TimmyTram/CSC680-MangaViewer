import Foundation


func fetchSales() {
    let url = URL(string: "https://www.gamerpower.com/api/giveaways?platform=steam")!
    
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        print(String(data: data, encoding: .utf8)!)
    }
    
    task.resume()
}
