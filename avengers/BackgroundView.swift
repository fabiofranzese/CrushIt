import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            // Left image
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(height: 320)
                .clipped()
                .offset(x: -30, y: -100)  // Shift left
            
            // Right image (on top of the left image)
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(height: 320)
                .clipped()
                .offset(x: 20, y: -100)  // Shift right
        }
    }
}
