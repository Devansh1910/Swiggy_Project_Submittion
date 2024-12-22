import SwiftUI

struct FilterSectionView: View {
    let filters: [String]
    @Binding var selectedFilter: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 13) {
                ForEach(filters.indices, id: \.self) { index in
                    FilterButton(
                        title: filters[index],
                        isSelected: selectedFilter == index
                    ) {
                        selectedFilter = index
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}
