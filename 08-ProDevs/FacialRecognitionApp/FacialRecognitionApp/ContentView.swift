//
//  ContentView.swift
//  FacialRecognitionApp
//
//  Created by 차지용 on 7/9/24.
//

import SwiftUI
import Vision

struct ContentView: View {
    
    let photoArray =  ["image1", "image2", "image3"]
    
    @State var message = ""
    @State var arrayIndex = 0
    
    var body: some View {
        VStack {
            Image(photoArray[arrayIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(radius: 3.0)
                .frame(width: 500, height: 500)
            Text(message)
                .padding()
            Button {
                analyzeImage(image: UIImage(named: photoArray[arrayIndex])!)
            } label: {
                Text("Analyze Image")
            }.padding()

            HStack {
                Spacer()
                Button {
                    if arrayIndex == 0 {
                        arrayIndex = photoArray.count - 1
                    } else {
                        arrayIndex -= 1
                    }
                    message = ""
                } label: {
                    Image(systemName: "chevron.left.square.fill")
                        .font(.largeTitle)
                }
                Spacer()
                Button {
                    if arrayIndex == photoArray.count - 1 {
                        arrayIndex = 0
                    } else {
                        arrayIndex += 1
                    }
                    message = ""
                } label: {
                    Image(systemName: "chevron.right.square.fill")
                        .font(.largeTitle)
                }
                Spacer()
            }
        }
        .padding()
    }
    
    func analyzeImage(image: UIImage) {
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        let request = VNDetectFaceRectanglesRequest(completionHandler: handleFaceRecognition)
        try! handler.perform([request])
    }
    
    func handleFaceRecognition(request: VNRequest, error: Error?) {
        guard let foundFaces = request.results as? [VNFaceObservation] else {
            fatalError("Can't find a face in the picture")
        }
        message = "Found \(foundFaces.count) faces in the picture"
    }
}

#Preview {
    ContentView()
}
