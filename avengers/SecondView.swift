import SwiftUI

struct PlanView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Your Plan")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    PlanStageRow(stageName: "Stage 1: Pre-contemplation", status: "Done", statusColor: .blue)
                    
                    PlanStageRow(stageName: "Stage 2: Contemplation", status: "Done", statusColor: .blue)
                    
                    PlanStageRow(stageName: "Stage 3: Preparation", status: "In progress", statusColor: .gray)
                    
                    PlanStageRow(stageName: "Stage 4: Action", status: "Upcoming", statusColor: .gray)
                    
                    PlanStageRow(stageName: "Stage 5: Maintenance", status: "Upcoming", statusColor: .gray)
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()  // Dismiss the view
                        }) {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }


            }
            .background(
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.bottom)
                    .rotationEffect(.degrees(180))
                    
            )
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
