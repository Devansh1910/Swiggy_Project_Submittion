import SwiftUI

struct RestaurantCard: View {
    let restaurant: Restaurant
    @State private var isFavorite = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Restaurant Image with Promo
            ZStack(alignment: .bottom) {
                Image(restaurant.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .black.opacity(0.2), location: 0),
                                .init(color: .black.opacity(0.8), location: 1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    )
                
                // Promo Message
                if let promoMessage = restaurant.promoMessage {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(promoMessage)
                            .font(.caption2)
                            .fontWeight(.medium)
                        if let amount = restaurant.promoAmount {
                            Text(amount)
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundColor(.white)
                    .padding(8)
                }
                
                // Favorite Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: { isFavorite.toggle() }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .white)
                                .padding(8)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                        }
                    }
                    Spacer()
                }
                .padding(8)
            }
            
            // Restaurant Details
            VStack(alignment: .leading, spacing: 4) {
                if let bestIn = restaurant.isBestIn {
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.yellow)
                        Text(bestIn)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(4)
                }
                
                Text(restaurant.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    Text(String(format: "%.1f", restaurant.rating))
                        .fontWeight(.medium)
                    Text("(\(restaurant.reviews))")
                    Text("•")
                    Text(restaurant.deliveryTime)
                }
                .font(.caption)
                
                Text(restaurant.cuisine)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Text("\(restaurant.area) • \(restaurant.distance)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Options Button
            Menu {
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: {}) {
                    Label("Report", systemImage: "exclamationmark.triangle")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}
