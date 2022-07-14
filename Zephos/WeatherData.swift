//
//  WeatherData.swift
//  Zephos
//
//  Created by Charles Watson on 14/7/2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherData = try? newJSONDecoder().decode(WeatherData.self, from: jsonData)

// MARK: - WeatherData
struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

// MARK: - Api
class Api: ObservableObject {
    @Published var main = [Weather]()

    func getData(completion:@escaping ([Weather]) -> ()){
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=-31.549250&lon=115.624329&appid=APIKEYHERE&units=metric") else{
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { Data, _, _ in
//            let main = try! JSONDecoder().decode([Weather].self, from: Data!)
            let WeatherData = try? JSONDecoder().decode(WeatherData.self, from: Data!)
            print(self.main)
            DispatchQueue.main.async {
                completion(self.main)
            }
        }.resume()
    }
}
