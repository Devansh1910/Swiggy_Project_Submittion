import SwiftUI

struct BannerSectionView: View {
    var isRefreshing: Bool
    
    let banners = [
        Banner(title: "Pizza", type: "Italian", rating: 4.5, mins: 30, imageName: "pizza"),
        Banner(title: "Burger", type: "Japanese", rating: 4.8, mins: 25, imageName: "burger"),
        Banner(title: "Biryaani", type: "Lucknow", rating: 4.3, mins: 20, imageName: "biryaani by kilo"),
        Banner(title: "Paratha", type: "Punjabi", rating: 4.6, mins: 15, imageName: "paratha"),
        Banner(title: "Veg Rolls", type: "Mexican", rating: 4.7, mins: 35, imageName: "veg rolls")
    ]
    
    var body: some View {
        if isRefreshing {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 200, height: 120)
                            .shimmer()
                    }
                }
                .padding(.horizontal)
            }
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(banners, id: \.self) { banner in
                        NavigationLink(destination: DetailView(banner: banner)) {
                            BannerCell(banner: banner)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// Supporting Struct for Banner Information
struct Banner: Hashable {
    let title: String
    let type: String
    let rating: Double
    let mins: Int
    let imageName: String
}


// Preview
struct BannerSectionView_Previews: PreviewProvider {
    static var previews: some View {
        BannerSectionView(isRefreshing: false)
    }
}
