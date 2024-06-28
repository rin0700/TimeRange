//
//  PickerOverlay.swift
//  TimeRange
//
//  Created by komamura ryuichi on 2024/06/27.
//

//時間選択用Wheel
import SwiftUI

struct PickerView: View {
    @Binding var hour: Int
    @Binding var isVisible: Bool

    var body: some View {
        if isVisible{
            Picker("", selection: $hour) {
                ForEach(0..<24, id: \.self) { hour in
                    Text("\(hour)")
                        .tag(hour)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
            .padding(.top, 400)
            .onChange(of: hour) {
                self.isVisible = false
            }
        }
    }

}
