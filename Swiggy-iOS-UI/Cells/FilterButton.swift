import SwiftUI

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    isSelected ? Color.black : Color.clear
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.clear : Color.black, lineWidth: 1)
                )
                .cornerRadius(20)
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 14) {
            FilterButton(title: "Selected", isSelected: true, action: {})
            FilterButton(title: "Not Selected", isSelected: false, action: {})
        }
        .padding()
    }
}
