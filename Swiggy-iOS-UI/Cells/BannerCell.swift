import SwiftUI

struct BannerCell: View {
    let banner: Banner

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                // Image with gradient overlay and rounded corners
                ZStack(alignment: .bottomLeading) {
                    Image(banner.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 15))

                    // Gradient Overlay
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0.9)]),
                                   startPoint: .top, endPoint: .bottom)
                        .frame(height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 15))

                    // Bottom Text Overlay
                    VStack(alignment: .leading) {
                        Text("Items")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                        Text("AT ₹49")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding([.leading, .bottom], 12)
                }

                // Heart Icon
                Button(action: {
                    // Action for favorite
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                        .padding(8)
                }
            }

            // Food Title
            Text(banner.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
                .truncationMode(.tail)

            // Food Type
            Text(banner.type)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)

            // Ratings and Time
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", banner.rating))
                        .font(.caption)
                        .foregroundColor(.primary)
                }

                Spacer()

                Text("\(banner.mins) mins")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 140)
    }
}

// Supporting Struct for Banner Informatio
