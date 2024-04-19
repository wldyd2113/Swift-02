//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 차지용 on 4/19/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
        Text("Timer Count = \(timerData.timeCount)")
            .font(.headline)
    }
}

#Preview {
    SecondView()
        .environmentObject(TimerData())
}
