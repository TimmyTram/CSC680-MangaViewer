import Foundation


struct GameDeal: Codable, Hashable {
    let id: Int
    let title: String
    let worth: String
    let thumbnail: String
    let image: String
    let description: String
    let instructions: String
    let open_giveaway_url: String
    let published_date: String
    let platforms: String
    let end_date: String
    let users: Int
    let status: String
    let gamerpower_url: String
    let open_giveaway: String
}
