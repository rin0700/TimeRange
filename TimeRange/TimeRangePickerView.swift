//
//  TimeRangePicker.swift
//  TimeRange
//
//  Created by komamura ryuichi on 2024/06/27.
//

//時間選択のUI
import SwiftUI

struct TimeRangePickerView: View {
        @Binding var startHour: Int
        @Binding var endHour: Int
        @Binding var startPickerVisible: Bool
        @Binding var endPickerVisible: Bool

    var body: some View {
        HStack {
            TextField("", text: .constant("\(startHour)"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    self.endPickerVisible = false
                    self.startPickerVisible.toggle()
                }
            Text("~")
            TextField("", text: .constant("\(endHour)"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    self.startPickerVisible = false
                    self.endPickerVisible.toggle()
            }
        }.padding()
    }
}
