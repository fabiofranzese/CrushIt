import SwiftUI

struct NewPageView: View {
    @State private var todaysActivity: String = ""
    @State private var diaryEntry: String = ""
    @State private var selectedCigarettes = "None"
    @State private var selectedMood: String? = nil
    @State private var currentDate = Date() // Track the current date
    @State private var selectedDay: Date? = nil // Track the selected day
    
    let cigarettesOptions = ["None", "1-5", "6-10", "10+"]
    let moods = ["😡", "😞", "😟", "😩", "😊"]
    
    // Function to get the days of the month
    func getDaysOfMonth() -> [Int] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        return Array(range)
    }
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 227 / 255, green: 227 / 255, blue: 232 / 255)
                .ignoresSafeArea()
            
            VStack {
                Text("Today")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, -10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(getDaysOfMonth(), id: \.self) { day in
                            Text("\(day)")
                                .font(.title)
                                .frame(width: 40, height: 40)
                                .foregroundColor(selectedDay == Calendar.current.date(bySetting: .day, value: day, of: currentDate) ? .white : .black)
                                .background(
                                    selectedDay == Calendar.current.date(bySetting: .day, value: day, of: currentDate)
                                    ? Color.purple
                                    : Color.clear
                                )
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedDay = Calendar.current.date(bySetting: .day, value: day, of: currentDate)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                
                // Today's Cigarettes section with Menu
                VStack(alignment: .leading) {
                    Menu {
                        ForEach(cigarettesOptions, id: \.self) { option in
                            Button(option) {
                                selectedCigarettes = option
                            }
                        }
                    } label: {
                        HStack {
                            Text("Today's Cigarettes")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Text(selectedCigarettes)
                                .foregroundColor(.gray)
                            Image(systemName: "arrow.up.and.down.circle")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                }
                .padding(.top, 20)
                
                // Mood section
                VStack(alignment: .leading) {
                    Text("Moods")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    HStack {
                        ForEach(moods, id: \.self) { mood in
                            Text(mood)
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedMood == mood ? Color.blue.opacity(0.2) : Color.white)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedMood = mood
                                }
                        }
                    }
                }
                .padding(.top, 10)
                
                // Today's activity
                VStack(alignment: .leading) {
                    Text("Today's activity")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 1)
                        .overlay(
                            TextEditor(text: $todaysActivity)
                                .cornerRadius(3)
                                .padding()
                        )
                        .padding(.horizontal)
                }
                
                // Write Diary
                VStack(alignment: .leading) {
                    Text("Write Diary")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 1)
                        .overlay(
                            TextEditor(text: $diaryEntry)
                                .padding()
                                .cornerRadius(3)
                        )
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct NewPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewPageView()
    }
}
