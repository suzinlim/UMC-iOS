//
//  WeatherAPIInput.swift
//  OpenAPI
//
//  Created by 임수진 on 2023/12/08.
//

struct WeatherAPIInput : Encodable {
    var q : String? // 지역
    var appid : String? // api key
}
