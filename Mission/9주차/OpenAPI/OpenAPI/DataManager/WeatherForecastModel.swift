//
//  WeatherForecastModel.swift
//  OpenAPI
//
//  Created by 임수진 on 2023/12/08.
//

struct WeatherForecastModel : Decodable {
    let list: [WeatherInfo]

        struct WeatherInfo: Decodable {
            let dt_txt: String // 날짜와 시간 정보
            let main: MainInfo // 기온 및 습도 등
            let weather: [WeatherDescription] // 날씨 정보
        }

        struct MainInfo: Decodable {
            let temp_max: Double
        }

        struct WeatherDescription: Decodable {
            let main: String
            let description: String
        }
}
