import SwiftUI

struct RestaurantInfoSection: View {
    @Binding var restaurants: [Restaurant] // Accept restaurants as binding

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Top \(restaurants.count) restaurants to explore")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.top, 8)
            
            RestaurantListView(restaurants: $restaurants)
        }
    }
}
