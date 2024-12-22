import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSegment = 0
    @State private var isFavorite = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header Image Section
                headerSection
                
                // Restaurant Info Section
                restaurantInfoSection
                
                // Segments Control
                segmentControl
                
                // Content based on selected segment
                switch selectedSegment {
                case 0:
                    menuSection
                case 1:
                    reviewsSection
                default:
                    infoSection
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .top) {
            navigationBar
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }

    // MARK: - Navigation Bar
    private var navigationBar: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            Spacer()
            HStack(spacing: 16) {
                Button(action: { isFavorite.toggle() }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                }
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Image(restaurant.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            if let promoMessage = restaurant.promoMessage {
                VStack(alignment: .leading) {
                    Text(promoMessage)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    if let amount = restaurant.promoAmount {
                        Text(amount)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .foregroundColor(.white)
                .padding()
            }
        }
    }
    
    // MARK: - Restaurant Info Section
    private var restaurantInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(restaurant.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(restaurant.cuisine)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack(spacing: 16) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    Text(String(format: "%.1f", restaurant.rating))
                    Text("(\(restaurant.reviews))")
                }
                Text("•")
                Text(restaurant.deliveryTime)
                Text("•")
                Text(restaurant.costForTwo)
            }
            .font(.subheadline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(restaurant.features, id: \.self) { feature in
                        Text(feature)
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(16)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
    }
    
    // MARK: - Segment Control
    private var segmentControl: some View {
        Picker("View Selection", selection: $selectedSegment) {
            Text("Menu").tag(0)
            Text("Reviews").tag(1)
            Text("Info").tag(2)
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    // MARK: - Menu Section
    private var menuSection: some View {
        LazyVStack(alignment: .leading, spacing: 24, pinnedViews: .sectionHeaders) {
            ForEach(restaurant.menuCategories) { category in
                Section {
                    ForEach(category.items) { item in
                        MenuItemRow(item: item)
                    }
                } header: {
                    Text(category.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                }
            }
        }
        .padding(.top)
    }
    
    // MARK: - Reviews Section
    private var reviewsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Reviews coming soon...")
                .padding()
        }
    }
    
    // MARK: - Info Section
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Address")
                    .font(.headline)
                Text(restaurant.address)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Opening Hours")
                    .font(.headline)
                Text(restaurant.timing)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("More Info")
                    .font(.headline)
                Text("Cost for Two: \(restaurant.costForTwo)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

// MARK: - Menu Item Row
struct MenuItemRow: View {
    let item: Restaurant.MenuItem
    @State private var isAddedToCart = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: item.isVeg ? "leaf.fill" : "circle.fill")
                        .foregroundColor(item.isVeg ? .green : .red)
                    if item.isBestseller {
                        Text("★ Bestseller")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.orange.opacity(0.1))
                            .foregroundColor(.orange)
                            .cornerRadius(4)
                    }
                }
                
                Text(item.name)
                    .font(.headline)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(item.price)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            Image(item.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    Button(action: { isAddedToCart.toggle() }) {
                        Text(isAddedToCart ? "ADDED" : "ADD")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(isAddedToCart ? Color.green : Color.white)
                            .foregroundColor(isAddedToCart ? .white : .green)
                            .cornerRadius(4)
                    }
                    .padding(8),
                    alignment: .bottom
                )
        }
        .padding()
        .background(Color.white)
    }
}

// Example Usage with Sample Data
extension Restaurant {
    static let sampleMenuCategories = [
        MenuCategory(name: "Recommended", items: [
            MenuItem(
                name: "McSpicy Chicken Burger",
                description: "Crispy chicken patty topped with lettuce and cheese slice, served with spicy sauce",
                price: "₹189",
                imageUrl: "mcspicy",
                isVeg: false,
                isBestseller: true
            ),
            MenuItem(
                name: "McVeggie Burger",
                description: "Vegetable patty with lettuce, mayonnaise, and cheese slice",
                price: "₹149",
                imageUrl: "mcveggie",
                isVeg: true,
                isBestseller: false
            )
        ]),
        MenuCategory(name: "Value Meals", items: [
            MenuItem(
                name: "Big Mac Meal",
                description: "Iconic Big Mac burger served with fries and Coke",
                price: "₹399",
                imageUrl: "bigmac",
                isVeg: false,
                isBestseller: true
            )
        ])
    ]
    
    static let sampleFeatures = [
        "Pure Veg Available",
        "Table Booking",
        "Home Delivery",
        "Indoor Seating",
        "Birthday Celebration"
    ]
}

#Preview {
    RestaurantDetailView(
        restaurant: Restaurant(
            name: "McDonald's",
            cuisine: "American, Burgers, Fast Food",
            rating: 4.4,
            reviews: "20K+",
            deliveryTime: "25-30 mins",
            distance: "3.6 km",
            promoMessage: "ITEMS AT",
            promoAmount: "₹49",
            imageUrl: "mcdonalds",
            isBestIn: "Best In Burger",
            area: "Civil Lines",
            address: "Shop 42, Ground Floor, Unity One Mall, Civil Lines, Delhi",
            timing: "11:00 AM - 11:00 PM",
            costForTwo: "₹400 for two",
            features: Restaurant.sampleFeatures,
            menuCategories: Restaurant.sampleMenuCategories
        )
    )
}
