//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{ //Stack뷰는 10개 정도에 view를 보여줄때 적합
            HStack {
                Group {
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                }
                Group {
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.30")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
