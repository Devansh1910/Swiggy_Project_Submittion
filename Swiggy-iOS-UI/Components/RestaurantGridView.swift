import SwiftUI

struct RestaurantListView: View {
    @Binding var restaurants: [Restaurant]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        RestaurantCard(restaurant: restaurant)
                    }
                    .buttonStyle(PlainButtonStyle()) // To avoid default button animation
                }
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }
}

extension Restaurant {
    static let sampleData: [Restaurant] = [
        Restaurant(
            name: "McDonald's",
            cuisine: "American, Burgers, Fast Food",
            rating: 4.4,
            reviews: "20K+",
            deliveryTime: "25-30 mins",
            distance: "3.6 km",
            promoMessage: "ITEMS AT",
            promoAmount: "₹49",
            imageUrl: "burger",
            isBestIn: "Best In Burger",
            area: "Civil Lines",
            address: "Shop 42, Ground Floor, Unity One Mall, Civil Lines, Delhi",
            timing: "11:00 AM - 11:00 PM",
            costForTwo: "₹400 for two",
            features: ["Pure Veg Available", "Home Delivery", "Table Booking"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "KFC",
            cuisine: "Burgers, Fast Food, Rolls & Wraps",
            rating: 4.3,
            reviews: "10K+",
            deliveryTime: "20-25 mins",
            distance: "3.0 km",
            promoMessage: "40% OFF",
            promoAmount: "UPTO ₹80",
            imageUrl: "kfc",
            isBestIn: nil,
            area: "Civil Lines",
            address: "Ground Floor, D Mall, Civil Lines, Delhi",
            timing: "10:00 AM - 11:00 PM",
            costForTwo: "₹500 for two",
            features: ["Drive Thru", "Home Delivery", "Indoor Seating"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Domino's Pizza",
            cuisine: "Pizza, Italian, Fast Food",
            rating: 4.2,
            reviews: "15K+",
            deliveryTime: "30-35 mins",
            distance: "2.8 km",
            promoMessage: "BUY 1 GET 1",
            promoAmount: "FREE",
            imageUrl: "pizza",
            isBestIn: "Best In Pizza",
            area: "Model Town",
            address: "12th Street, Model Town, Delhi",
            timing: "10:30 AM - 11:30 PM",
            costForTwo: "₹600 for two",
            features: ["Party Orders", "Home Delivery", "Custom Pizzas"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Subway",
            cuisine: "Healthy Food, Sandwiches, Salads",
            rating: 4.5,
            reviews: "8K+",
            deliveryTime: "15-20 mins",
            distance: "2.5 km",
            promoMessage: "FLAT 25% OFF",
            promoAmount: "ON ₹150",
            imageUrl: "veg rolls",
            isBestIn: nil,
            area: "Rohini",
            address: "Shop 3, Central Market, Rohini, Delhi",
            timing: "9:00 AM - 11:00 PM",
            costForTwo: "₹300 for two",
            features: ["Healthy Options", "Takeaway", "Home Delivery"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Burger King",
            cuisine: "Burgers, Fast Food",
            rating: 4.1,
            reviews: "12K+",
            deliveryTime: "20-25 mins",
            distance: "3.2 km",
            promoMessage: "ITEMS START AT",
            promoAmount: "₹99",
            imageUrl: "burger",
            isBestIn: nil,
            area: "Pitampura",
            address: "City Square Mall, Pitampura, Delhi",
            timing: "11:00 AM - 11:00 PM",
            costForTwo: "₹350 for two",
            features: ["Home Delivery", "Family Deals", "Quick Service"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Pizza Hut",
            cuisine: "Pizza, Fast Food, Italian",
            rating: 4.3,
            reviews: "9K+",
            deliveryTime: "25-30 mins",
            distance: "3.8 km",
            promoMessage: "FLAT ₹200 OFF",
            promoAmount: "ON ₹600",
            imageUrl: "pizza",
            isBestIn: nil,
            area: "Rajouri Garden",
            address: "Block D, Rajouri Garden, Delhi",
            timing: "11:00 AM - 11:30 PM",
            costForTwo: "₹700 for two",
            features: ["Family Seating", "Party Orders", "Custom Pizzas"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Barbeque Nation",
            cuisine: "BBQ, North Indian, Buffet",
            rating: 4.7,
            reviews: "5K+",
            deliveryTime: "45-50 mins",
            distance: "5.0 km",
            promoMessage: "FREE DESSERTS",
            promoAmount: "WITH BUFFET",
            imageUrl: "bbq",
            isBestIn: "Best BBQ",
            area: "Connaught Place",
            address: "Block A, Connaught Place, Delhi",
            timing: "12:00 PM - 11:00 PM",
            costForTwo: "₹1,600 for two",
            features: ["Buffet", "Family Dining", "Takeaway"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Haldiram's",
            cuisine: "North Indian, South Indian, Snacks",
            rating: 4.6,
            reviews: "18K+",
            deliveryTime: "20-25 mins",
            distance: "3.4 km",
            promoMessage: "SPECIAL THALI",
            promoAmount: "₹180",
            imageUrl: "makhani darbar",
            isBestIn: nil,
            area: "Karol Bagh",
            address: "Pusa Road, Karol Bagh, Delhi",
            timing: "9:00 AM - 11:00 PM",
            costForTwo: "₹500 for two",
            features: ["Pure Veg", "Takeaway", "Home Delivery"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Bikanervala",
            cuisine: "North Indian, Sweets, Snacks",
            rating: 4.5,
            reviews: "11K+",
            deliveryTime: "15-20 mins",
            distance: "3.1 km",
            promoMessage: "FREE SWEETS",
            promoAmount: "WITH ₹300+",
            imageUrl: "gifthamper",
            isBestIn: nil,
            area: "Janakpuri",
            address: "Block C, District Center, Janakpuri, Delhi",
            timing: "9:00 AM - 11:00 PM",
            costForTwo: "₹400 for two",
            features: ["Family Dining", "Takeaway", "Pure Veg"],
            menuCategories: Restaurant.sampleMenuCategories
        ),
        Restaurant(
            name: "Wow! Momo",
            cuisine: "Momos, Chinese, Fast Food",
            rating: 4.3,
            reviews: "7K+",
            deliveryTime: "20-25 mins",
            distance: "2.7 km",
            promoMessage: "50% OFF",
            promoAmount: "UPTO ₹100",
            imageUrl: "the belgian waffle",
            isBestIn: nil,
            area: "Punjabi Bagh",
            address: "Ring Road, Punjabi Bagh, Delhi",
            timing: "11:00 AM - 11:00 PM",
            costForTwo: "₹300 for two",
            features: ["Quick Bites", "Home Delivery", "Party Orders"],
            menuCategories: Restaurant.sampleMenuCategories
        )
    ]
}
