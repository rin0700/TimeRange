import SwiftUI

struct ContentView: View {
    @State private var realTime = Date()
    @State private var startHour = 0
    @State private var endHour = 0
    @State private var startPickerVisible = false
    @State private var endPickerVisible = false
    @State private var result = ""
    
    var body: some View {
        ZStack {
            VStack {
                TimeDisplayView()
                
                Text("範囲を指定してください")
                
                TimeRangePickerView(startHour: $startHour, endHour: $endHour, startPickerVisible: $startPickerVisible, endPickerVisible: $endPickerVisible)
                
                Button(action: {
                    result = isTimeInRange(time: realTime, startTime: startHour, endTime: endHour) ? "範囲内" : "範囲外"
                }) {
                    Text("チェック")
                }
                .padding()
                
                Text(result)
                    .padding()
            }
            PickerView(hour: $startHour, isVisible: $startPickerVisible)
            PickerView(hour: $endHour, isVisible: $endPickerVisible)
        }
    }
    
    func isTimeInRange(time: Date, startTime: Int, endTime: Int) -> Bool {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: time)
        
        if startTime == endTime {
            return hour == startTime
        }
        
        if startTime < endTime {
            return hour >= startTime && hour < endTime
        } else {
            return hour >= startTime || hour < endTime
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
