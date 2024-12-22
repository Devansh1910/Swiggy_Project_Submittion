import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let reviews: String
    let deliveryTime: String
    let distance: String
    let promoMessage: String?
    let promoAmount: String?
    let imageUrl: String
    let isBestIn: String?
    let area: String
    
    // Additional details
    let address: String
    let timing: String
    let costForTwo: String
    let features: [String]
    let menuCategories: [MenuCategory]
    
    struct MenuItem: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let price: String
        let imageUrl: String
        let isVeg: Bool
        let isBestseller: Bool
    }

    struct MenuCategory: Identifiable {
        let id = UUID()
        let name: String
        let items: [MenuItem]
    }
}
