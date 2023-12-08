//
//  WeatherModel.swift
//  OpenAPI
//
//  Created by 임수진 on 2023/12/08.
//

struct WeatherModel: Decodable {
    var name: String // 지역
    var main: WeatherDetails // 온도 정보
    
    struct WeatherDetails: Decodable {
        var temp: Double // 현재 온도
        var temp_min: Double // 최저 온도
        var temp_max: Double // 최고 온도
    }
}
