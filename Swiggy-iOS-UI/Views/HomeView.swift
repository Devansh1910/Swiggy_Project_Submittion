import SwiftUI

struct HomeView: View {
    @State private var isRefreshing = false
    @State private var selectedFilter = 0
    @State private var headerBackgroundColor = Color(hex: "FF6016").opacity(1)
    @State private var filterOffset: CGFloat = 0
    @State private var shouldPinFilter = false
    
    let filters = ["Reorder", "Your Eatlists", "Favourites ❤️"]
    @State private var restaurants = Restaurant.sampleData

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            Section(header:
                                VStack(spacing: 0) {
                                    HeaderView(backgroundColor: $headerBackgroundColor)
                                        .background(headerBackgroundColor)
                                    if shouldPinFilter {
                                        FilterSectionView(filters: filters, selectedFilter: $selectedFilter)
                                            .background(Color.white)
                                            .transition(.opacity)
                                    }
                                }
                            ) {
                                VStack(spacing: 0) {
                                    HeaderContentView(headerBackgroundColor: $headerBackgroundColor)
                                    
                                    CarouselView(isRefreshing: isRefreshing)
                                        .padding()
                                    
                                    // Original filter position AFTER carousel
                                    VStack {
                                        FilterSectionView(filters: filters, selectedFilter: $selectedFilter)
                                            .background(Color.white)
                                            .opacity(shouldPinFilter ? 0 : 1)
                                    }
                                    .background(
                                        GeometryReader { geometry -> Color in
                                            let offset = geometry.frame(in: .named("scroll")).minY
                                            DispatchQueue.main.async {
                                                self.filterOffset = offset
                                                // Only pin when we've scrolled past the original position
                                                self.shouldPinFilter = offset < 120 // Adjust this value
                                            }
                                            return Color.clear
                                        }
                                    )
                                    
                                    BannerSectionView(isRefreshing: isRefreshing)
                                    AdditionalFiltersView()
                                    RestaurantListView(restaurants: $restaurants)
                                }
                            }
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .refreshable {
                        refreshContent()
                    }
                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.top)
                
                if isRefreshing {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                        
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                            
                            LottieView(name: "refresh", loopMode: .loop)
                                .frame(width: 60, height: 60)
                        }
                        .offset(y: isRefreshing ? 0 : -200)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: isRefreshing)
                    }
                }
            }
        }
    }
    
    private func refreshContent() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isRefreshing = false
        }
    }
}
