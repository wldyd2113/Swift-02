//
//  Array+Safe.swift
//  AlbertosTests
//
//  Created by 차지용 on 7/11/24.
//

import Foundation

extension Array {
  subscript(safe index: Index) -> Element? {
    0 <= index && index < count ? self[index] : nil
  }
}
