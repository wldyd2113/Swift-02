//
//  ActivityIndicator.swift
//  UIKitToSwoftUI
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable { //UIViewRepresentable스위프트 UIKit을 사용하기 위한 프로토콜
    var animating: Bool
    
    func makeUIView(context: Context) ->
        UIActivityIndicatorView {
            return UIActivityIndicatorView()
        }
        
        func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
            if animating {
                activityIndicator.startAnimating()
            }
            else {
                activityIndicator.stopAnimating()
            }
        }
    }

