import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.5), Color.clear]),
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )
                    .rotationEffect(.degrees(30))
                    .offset(x: phase * 300, y: 0)
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: phase)
            )
            .onAppear {
                phase = 1
            }
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
