import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipped()
                        .offset(x: -50, y: -200)
                        .ignoresSafeArea()
                    
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                        .offset(x: 0, y: -200)
    
                    VStack {
                        Text("Today's Goal: ")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            
                        +
                        Text("8 cigarettes")
                            .font(.system(size: 28))
                            .foregroundColor(.accentColor)
                            .bold()
                        
                    }
                    .padding(.top, -140)
                    
                    .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                
                HStack {
                    ForEach(7..<14) { number in
                        NavigationLink {
                            if number == viewmodel.CurrDayCount + 3{
                                DayInsertView()
                            } else{
                                DayView()
                            }
                        } label: {
                            Circle()
                            .fill(number == 8 || number == 9 ? Color.green : Color.gray.opacity(0.2))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text("\(number)")
                                    .font(.title2)
                                    .foregroundColor(number == 7 ? .red : .black)
                            )
                            .padding(3)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .alignmentGuide(.top) { d in d[.top] }
            .navigationTitle("Stage 3, Week 16")
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}

// Scale and Opacity
