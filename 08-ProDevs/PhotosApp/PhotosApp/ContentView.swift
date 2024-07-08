//
//  ContentView.swift
//  PhotosApp
//
//  Created by 차지용 on 7/8/24.
//

import SwiftUI
import PhotosUI
struct ContentView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedimageData: Data?
    
    var body: some View {
        VStack {
            if let selectedimageData,
               let uiImage = UIImage(data: selectedimageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.gray)
            }
            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Text("Select a photo")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .presentationCornerRadius(10)
            }
        }
        .padding()
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                    selectedimageData = data
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
