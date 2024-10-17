import SwiftUI

struct StageDetailView: View {
    @State private var selectedDate: Date?
    @State private var selectedYear: Int = Calendar.current.component(.year, from: Date())
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    @State private var stageDescription: String = ""
    @State private var isPickerVisible = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Stage 3: Preparation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top)

                Text("STAGE DESCRIPTION")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 10)

                TextEditor(text: $stageDescription)
                    .frame(height: 150)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Button(action: {
                        previousMonth()
                    }) {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    Text("\(Calendar.current.monthSymbols[selectedMonth - 1]) \(selectedYear)")
                        .font(.headline)
                        .onTapGesture {
                            isPickerVisible.toggle()
                        }

                    Spacer()

                    Button(action: {
                        nextMonth()
                    }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding()

                if isPickerVisible {
                    VStack {
                        Picker("Select Month", selection: $selectedMonth) {
                            ForEach(1..<13, id: \.self) { month in
                                Text(Calendar.current.monthSymbols[month - 1]).tag(month)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())

                        Picker("Select Year", selection: $selectedYear) {
                            ForEach(1900...2100, id: \.self) { year in
                                Text(String(year)).tag(year)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    .frame(height: 200)
                    .background(Color(.systemGray6))
                }

                CalendarView(selectedDate: $selectedDate, selectedYear: selectedYear, selectedMonth: selectedMonth, closePicker: {
                    isPickerVisible = false
                })
                .frame(height: 300)
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Toolbar content if needed
            }
            .background(Color(.systemGroupedBackground))
        }
    }

    private func previousMonth() {
        if selectedMonth == 1 {
            selectedMonth = 12
            selectedYear -= 1
        } else {
            selectedMonth -= 1
        }
    }

    private func nextMonth() {
        if selectedMonth == 12 {
            selectedMonth = 1
            selectedYear += 1
        } else {
            selectedMonth += 1
        }
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date?
    var selectedYear: Int
    var selectedMonth: Int
    var closePicker: () -> Void

    let calendar = Calendar.current
    let dateFormatter = DateFormatter()

    init(selectedDate: Binding<Date?>, selectedYear: Int, selectedMonth: Int, closePicker: @escaping () -> Void) {
        self._selectedDate = selectedDate
        self.selectedYear = selectedYear
        self.selectedMonth = selectedMonth
        self.closePicker = closePicker
        dateFormatter.dateFormat = "d"
    }

    var body: some View {
        let days = getDaysInSelectedMonth(year: selectedYear, month: selectedMonth)

        VStack {
            HStack {
                ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { day in
                    Text(day)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
            }

            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    if day.isPlaceholder {
                        Text("")
                            .frame(width: 40, height: 40)
                    } else {
                        Text(day.day)
                            .frame(width: 40, height: 40)
                            .background(isSelected(day) ? Color.blue : Color.clear)
                            .foregroundColor(isSelected(day) ? .white : .black)
                            .cornerRadius(20)
                            .onTapGesture {
                                selectedDate = day.date
                                closePicker() // Close the picker when a date is selected
                            }
                    }
                }
            }
        }
    }

    private func getDaysInSelectedMonth(year: Int, month: Int) -> [DayViewModel] {
        var components = DateComponents()
        components.year = year
        components.month = month
        let startOfMonth = calendar.date(from: components)!

        let firstDayOfWeek = calendar.component(.weekday, from: startOfMonth) - 1

        let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
        var days: [DayViewModel] = []

        for _ in 0..<firstDayOfWeek {
            days.append(DayViewModel(day: "", date: Date(), isPlaceholder: true))
        }

        for day in range {
            let date = calendar.date(bySetting: .day, value: day, of: startOfMonth)!
            days.append(DayViewModel(day: "\(day)", date: date))
        }

        return days
    }

    private func isSelected(_ day: DayViewModel) -> Bool {
        guard let selectedDate = selectedDate, !day.isPlaceholder else { return false }
        return calendar.isDate(selectedDate, inSameDayAs: day.date)
    }
}

struct DayViewModel: Hashable {
    let day: String
    let date: Date
    let isPlaceholder: Bool

    init(day: String, date: Date, isPlaceholder: Bool = false) {
        self.day = day
        self.date = date
        self.isPlaceholder = isPlaceholder
    }
}

struct StageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StageDetailView()
    }
}
