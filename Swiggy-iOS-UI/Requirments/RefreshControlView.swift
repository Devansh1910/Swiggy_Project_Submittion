import SwiftUI
import Lottie

struct RefreshAnimationView: View {
    var body: some View {
        LottieView(name: "refresh", loopMode: .loop)
            .frame(height: 80)
            .padding()
    }
}
