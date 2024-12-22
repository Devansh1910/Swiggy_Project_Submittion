import SwiftUI

struct CarouselView: View {
    var isRefreshing: Bool

    @State private var isLoading = true
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    private let images = ["image1", "image2", "image3", "image4"]

    var body: some View {
        VStack(spacing: 8) {
            if isLoading {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 140)
                    .shimmer()
            } else {
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .tag(index)
                    }
                }
                .frame(height: 140)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % images.count
                    }
                }
            }
        }
        .onAppear {
            simulateLoading()
        }
    }

    private func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // Skip the hash symbol if present
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
