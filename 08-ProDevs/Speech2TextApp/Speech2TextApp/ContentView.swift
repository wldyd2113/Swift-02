//
//  ContentView.swift
//  Speech2TextApp
//
//  Created by 차지용 on 7/8/24.
//

import SwiftUI
import Speech

struct ContentView: View {
    let audioEngin = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
    
    @State var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @State var recognitionTask: SFSpeechRecognitionTask?
    
    @State var message = ""
    @State var buttonStatus = true
    
    func startRecording() {
        message = "Start recording"
        let node = audioEngin.inputNode
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest?.shouldReportPartialResults = true
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            recognitionRequest?.append(buffer)
        }
        audioEngin.prepare()
        do {
            try audioEngin.start()
        }
        catch {
            return print(error)
        }
        guard let recognizeMe = SFSpeechRecognizer() else {
            return
        }
        if !recognizeMe.isAvailable {
            return
        }
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest ?? SFSpeechAudioBufferRecognitionRequest.init(), resultHandler: {result, error in
            if let result = result {
                let transcribedString = result.bestTranscription.formattedString
                message = transcribedString
            } else if let error = error {
                print(error)
            }
        })
    }
    
    func stopRecording() {
        audioEngin.stop()
        recognitionTask?.cancel()
        audioEngin.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $message)
                .frame(width: 350, height: 400)
            Button(buttonStatus ? "Start recording" : "Stop recording", action: {
                buttonStatus.toggle()
                if buttonStatus {
                    stopRecording()
                } else {
                    startRecording()
                }
            })
            .padding()
            .background(buttonStatus ? Color.green : Color.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
