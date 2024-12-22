import SwiftUI

struct HeaderContentView: View {
    @Binding var headerBackgroundColor: Color

    var body: some View {
        ZStack {
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .fill(Color(hex: "FF6016").opacity(1))
                        .overlay(
                            Image("card")
                                .resizable()
                                .scaledToFit()
                        )
                        .frame(height: 216)
                        .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                        .onChange(of: geometry.frame(in: .global).minY) { _ in
                            updateHeaderBackground(geometry: geometry)
                        }
                }
                .frame(height: 216)
            }
        }

    private func updateHeaderBackground(geometry: GeometryProxy) {
        let containerPosition = geometry.frame(in: .global).minY
        headerBackgroundColor = containerPosition <= 0 ? .white : Color(hex: "FF6016").opacity(1)
    }
}
