import SwiftUI

struct StageDetailView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Stage Title
                Text("Stage 3: Preparation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top)

                // Stage Description
                Text("STAGE DESCRIPTION")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 10)

                Text("JDKFHDJKFHJDKFHDSFKJHJKSDHF")
                    .padding(.horizontal)
                    .padding(.bottom)

                // Calendar Icon
                HStack {
                    Image(systemName: "calendar")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Spacer()
                    Text("October 2024")
                        .font(.headline)
                        .padding(.trailing)
                }
                .padding()

                // Calendar Grid
                CalendarView()
                    .frame(height: 300)
                    .padding(.horizontal)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()  // Dismiss the view
                    }) {
                    }
                }
            }
            .background(Color(.systemGroupedBackground)) 
        }
    }
}

struct CalendarView: View {
    var body: some View {
        // Simple grid to represent the calendar
        let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let dates = Array(1...31) // Simple representation of days

        VStack {
            // Day headers
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
            }

            // Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns) {
                ForEach(0..<dates.count, id: \.self) { index in
                    Text("\(dates[index])")
                        .frame(width: 40, height: 40)
                        .background(index == 9 ? Color.blue : Color.clear) // Highlight selected date
                        .foregroundColor(index == 9 ? .white : .black)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct StageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StageDetailView()
    }
}
