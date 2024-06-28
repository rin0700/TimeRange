//
//  TimeDisplayView.swift
//  TimeRange
//
//  Created by komamura ryuichi on 2024/06/27.
//

//現在の時刻を表示
import SwiftUI

struct TimeDisplayView: View {
    @State private var realTime = Date()
    private let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("現在の時刻 ： \(formattedTime(realTime))")
            .padding()
            .font(.title)
            .onReceive(timer) { input in
                self.realTime = input
            }
    }
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

}
