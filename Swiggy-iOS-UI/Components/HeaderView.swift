import SwiftUI

struct HeaderView: View {
    @Binding var backgroundColor: Color
    @State private var searchText: String = "" // To hold the input text
    @State private var currentSearchPromptIndex = 0
    private let searchPrompts = ["Cake", "Food", "Chole", "Chinese"]
    
    var body: some View {
        VStack(spacing: 12) {
            Color.clear
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
            
            // Location and Profile Section
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(backgroundColor == Color(hex: "FF6016").opacity(1) ? .white : .gray) // Dynamic color
                        
                        Text("Shivam Guesthouse")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(backgroundColor == Color(hex: "FF6016").opacity(1) ? .white : .black) // Dynamic color
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(backgroundColor == Color(hex: "FF6016").opacity(1) ? .white : .black) // Dynamic color
                    }
                    
                    // Delivery Location underneath
                    Text("Gali No. 3, Hoshiyarpur Village, Sector 34, Noida")
                        .font(.caption)
                        .foregroundColor(backgroundColor == Color(hex: "FF6016").opacity(1) ? .white : .gray) // Dynamic color
                }
                Spacer()
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray.opacity(0.2))
                    .overlay(Image(systemName: "person.fill"))
            }
            .padding(.horizontal)
            
            // Search Bar Section
            HStack {
                // TextField for user input
                TextField("Search for '\(searchPrompts[currentSearchPromptIndex])'", text: $searchText)
                    .foregroundColor(.gray)
                    .font(.callout)
                
                Spacer()
                
                // Search Icon
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                
                // Voice Icon
                Image(systemName: "mic.fill")
                    .foregroundColor(Color(hex: "FF6016"))
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
            }
            .padding(10)
            .background(Color.white) // White background for the search bar
            .cornerRadius(10)
            .overlay( // Add a border with gray color
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(backgroundColor)
        .onAppear {
            // Start timer to change search prompts dynamically
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                currentSearchPromptIndex = (currentSearchPromptIndex + 1) % searchPrompts.count
            }
        }
        .animation(.easeInOut, value: backgroundColor)
    }
}
