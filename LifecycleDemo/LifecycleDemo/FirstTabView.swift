//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by 차지용 on 4/19/24.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    var body: some View {
        Text(title)
            .onAppear(perform: { //이화면에 왔을때 반응
                print("onAppear triggred")
            })
            .onDisappear(perform: { //다른화면이로 이동했을때 반응
                print("onDisappear triggred")
                title = "View One Again"
            })
            .task(priority: .background) { //동시작업
                print("task trigred")
                title = await changeTitle()
            }
    }
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }

}

#Preview {
    FirstTabView()
}
