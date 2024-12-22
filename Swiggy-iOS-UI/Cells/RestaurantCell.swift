import SwiftUI

struct RestaurantCell: View {
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 140)
                .overlay(Text("Restaurant \(index)"))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Restaurant \(index)")
                    .font(.headline)
                Text("Cuisine Type")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("4.\(index)")
                    Text("•")
                    Text("\(20 + index) mins")
                }
                .font(.caption)
            }
            .padding(.vertical, 8)
        }
    }
}
