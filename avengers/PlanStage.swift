import SwiftUI

struct PlanView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    // Stage rows with system icons at the end
                    PlanStageRow(stageName: "Stage 1: Pre-contemplation", systemImageName: "checkmark.circle.fill", imageColor: .blue)
                        .opacity(0.7)
                    PlanStageRow(stageName: "Stage 2: Contemplation", systemImageName: "checkmark.circle.fill", imageColor: .blue)
                        .opacity(0.7)
                    PlanStageRow(stageName: "Stage 3: Preparation", systemImageName: "hourglass.circle.fill", imageColor: .gray)
                    
                    PlanStageRow(stageName: "Stage 4: Action", systemImageName: "lock.circle.fill", imageColor: .gray)
                        .opacity(0.5)
                    PlanStageRow(stageName: "Stage 5: Maintenance", systemImageName: "lock.circle.fill", imageColor: .gray)
                         .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.top, 80) // Moved down a little
                .background(Color(red: 227 / 255, green: 227 / 255, blue: 232 / 255))

                VStack {
                    Spacer()
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                        .frame(height: 240)
                        .ignoresSafeArea(edges: .bottom)
                }
            }
            .navigationTitle("Your Plan")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PlanStageRow: View {
    var stageName: String
    var systemImageName: String
    var imageColor: Color
    
    var body: some View {
        HStack {
            // Stage name on the left
            Text(stageName)
                .font(.system(size: 18))
                .foregroundColor(.black)
            
            Spacer()
            
            // System image icon on the right
            Image(systemName: systemImageName)
                .foregroundColor(imageColor)
                .font(.system(size: 24))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
