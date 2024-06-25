//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by 차지용 on 6/25/24.
//

import Foundation

struct WeatherData: Codable {
    var temperature: Double //섭씨온도
    var description: String //날씨 설명
    var humidity: Double //습도
    var windSpeed: Double //풍속
}
