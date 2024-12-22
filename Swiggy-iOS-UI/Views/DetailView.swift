import SwiftUI

struct DetailView: View {
    let banner: Banner
    @State private var showFullDescription = false
    
    let menuItems = [
        MenuItem(name: "Classic", price: "₹250", description: "Our signature preparation with secret spices and ingredients", isVeg: true, isBestSeller: true),
        MenuItem(name: "Special", price: "₹320", description: "Premium version with extra toppings and special sauce", isVeg: false, isBestSeller: true),
        MenuItem(name: "Regular", price: "₹180", description: "Perfect for light meals and quick bites", isVeg: true, isBestSeller: false)
    ]
    
    // Sample offers - in a real app, these would come from backend
    let offers = [
        "50% off up to ₹100",
        "Free delivery on your first order",
        "Use WELCOME50",
        "20% cashback with SmartPay"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Hero Image
                ZStack(alignment: .bottomLeading) {
                    Image(banner.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                        .clipped()
                        .overlay(
                            // Fallback if image fails to load
                            Color.gray.opacity(0.2)
                                .overlay(
                                    Image(systemName: "photo.fill")
                                        .foregroundColor(.gray)
                                        .font(.largeTitle)
                                )
                        )
                    
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 100)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(banner.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(banner.type) Cuisine")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                }
                
                // Restaurant Info
                VStack(alignment: .leading, spacing: 16) {
                    // Metrics
                    HStack(spacing: 0) {
                        InfoMetric(
                            icon: "star.fill",
                            value: String(format: "%.1f", banner.rating),
                            label: "Rating",
                            iconColor: .yellow
                        )
                        
                        VerticalDivider()
                        
                        InfoMetric(
                            icon: "clock.fill",
                            value: "\(banner.mins) mins",
                            label: "Delivery Time",
                            iconColor: .blue
                        )
                        
                        VerticalDivider()
                        
                        InfoMetric(
                            icon: "indianrupeesign",
                            value: "₹200-400",
                            label: "Cost for two",
                            iconColor: .green
                        )
                    }
                    .padding(.vertical, 12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Offers Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("OFFERS")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(offers, id: \.self) { offer in
                                    OfferView(text: offer)
                                }
                            }
                        }
                    }
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ABOUT")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Text("Experience the authentic taste of \(banner.type) cuisine at its finest. Our chefs prepare each dish with carefully selected ingredients and traditional recipes passed down through generations.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(showFullDescription ? nil : 2)
                        
                        Button(action: {
                            showFullDescription.toggle()
                        }) {
                            Text(showFullDescription ? "Read Less" : "Read More")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // Menu Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("MENU")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        ForEach(menuItems, id: \.name) { item in
                            MenuItemView(item: item)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)  // Add this line to hide bottom bar only in DetailView

        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Image(systemName: "heart")
                    }
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let description: String
    let isVeg: Bool
    let isBestSeller: Bool
}

struct InfoMetric: View {
    let icon: String
    let value: String
    let label: String
    let iconColor: Color
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundColor(iconColor)
                Text(value)
                    .fontWeight(.semibold)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct VerticalDivider: View {
    var body: some View {
        Color.gray.opacity(0.3)
            .frame(width: 1, height: 40)
    }
}

struct OfferView: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "tag.fill")
                .foregroundColor(.blue)
            Text(text)
                .font(.subheadline)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(8)
    }
}

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.isVeg ? "leaf.fill" : "circle.fill")
                .foregroundColor(item.isVeg ? .green : .red)
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    if item.isBestSeller {
                        Text("⭐️ Bestseller")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.yellow.opacity(0.2))
                            .cornerRadius(4)
                    }
                }
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(item.price)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("ADD")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

// Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(banner: Banner(
                title: "Pizza",
                type: "Italian",
                rating: 4.5,
                mins: 30,
                imageName: "pizza"
            ))
        }
    }
}
