import SwiftUI

struct AdditionalFiltersView: View {
    let additionalFilters = ["Pure Veg", "Rating 4.0+", "Rating 4.5+"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 13) {
                ForEach(additionalFilters, id: \.self) { filter in
                    FilterButton(
                        title: filter,
                        isSelected: false
                    ) {
                        // Handle filter action here if needed
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    AdditionalFiltersView()
}
