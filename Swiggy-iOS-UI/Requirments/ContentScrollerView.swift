import SwiftUI

struct ContentScrollView: View {
    @State private var isRefreshing = false

    let filters: [String]
    @Binding var selectedFilter: Int
    @Binding var headerBackgroundColor: Color
    @Binding var restaurants: [Restaurant] // Add restaurants as binding

    var body: some View {
        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
            Section(
                header: HeaderView(backgroundColor: $headerBackgroundColor)
                    .background(headerBackgroundColor)
            ) {
                VStack(spacing: 0) {
                    HeaderContentView(headerBackgroundColor: $headerBackgroundColor)
                    FilterSectionView(filters: filters, selectedFilter: $selectedFilter)
                    BannerSectionView(isRefreshing: isRefreshing)
                    AdditionalFiltersView()
                    
                    // Pass restaurants binding
                    RestaurantInfoSection(restaurants: $restaurants)
                }
            }
        }
    }
}
