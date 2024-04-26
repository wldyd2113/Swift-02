//
//  PostView.swift
//  CanvasPreview
//
//  Created by 차지용 on 4/26/24.
//

import SwiftUI

struct PostView: View {
    var title: String
    var text: String
    var imageName: String
    var body: some View {
        GeometryReader { gemotry in
            ScrollView {
                if gemotry.size.height > gemotry.size.width {
                    VStack (spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gemotry.size.width * 0.75)
                        VStack (alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                }
                else {
                    HStack (spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gemotry.size.height * 0.55)
                        VStack (alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    PostView(title: "weather forcast", text: "Scattered thunderstorms. Potential for heavy rainfall. Low 68F. Winds light and variable. Chance of rain 60%", imageName: "cloud.bolt.rain")
}
