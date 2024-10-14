import SwiftUI

struct PlanView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    PlanStageRow(stageName: "Stage 1: Pre-contemplation", status: "Done", statusColor: .blue)
                    
                    PlanStageRow(stageName: "Stage 2: Contemplation", status: "Done", statusColor: .blue)
                    
                    PlanStageRow(stageName: "Stage 3: Preparation", status: "In progress", statusColor: .gray)
                    
                    PlanStageRow(stageName: "Stage 4: Action", status: "Upcoming", statusColor: .gray)
                    
                    PlanStageRow(stageName: "Stage 5: Maintenance", status: "Upcoming", statusColor: .gray)
                    
                    Spacer()
                }
                .padding(.top, 80)
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
            .navigationTitle("title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Your Plan")
                        .padding(.top, 60)
                        .font(.system(size: 58))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct PlanStageRow: View {
    var stageName: String
    var status: String
    var statusColor: Color
    
    var body: some View {
        HStack {
            Text(stageName)
                .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
            Text(status)
                .font(.system(size: 16))
                .foregroundColor(statusColor)
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
