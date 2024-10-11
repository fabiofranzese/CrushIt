import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipped()
                    .offset(x: -50, y: -100)
                
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .offset(x: 0, y: -100)
                
                VStack {
                    Text("Stage 3, Week 16")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        
                    
                    Text("Today's Goal: ")
                        .font(.system(size: 24))
                        .foregroundColor(.black) +
                    Text("8 cigarettes")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                    
                }
                .padding(.top, -150)
                
                .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Image("monster")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 390)
                .padding(.top, -110)
            
            Spacer()
            
            HStack {
                ForEach(7..<14) { number in
                    Circle()
                        .fill(number == 8 || number == 9 ? Color.green : Color.gray.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Text("\(number)")
                                .font(.title2)
                                .foregroundColor(number == 7 ? .red : .black)
                        )
                }
            }
            .padding(.bottom, 50)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alignmentGuide(.top) { d in d[.top] }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
