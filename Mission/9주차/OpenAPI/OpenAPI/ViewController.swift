//
//  ViewController.swift
//  OpenAPI
//
//  Created by 임수진 on 2023/12/07.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var weatherData: [WeatherModel] = [] // 날씨 정보를 저장할 배열
    var weatherForecastData: [String: WeatherForecastModel] = [:] // 각 지역의 날씨 예측 정보를 저장할 딕셔너리
    
    // AppDelegate의 인스턴스에서 apikey 참조
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        searchBar.delegate = self
        let WeatherNib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tableView.register(WeatherNib, forCellReuseIdentifier: "WeatherTableViewCell")
    }
    
    // UISearchBarDelegate 메서드 구현
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        // 검색어를 사용하여 API 요청 및 처리하는 함수 호출
        if let apiKey = appDelegate.apiKey {
            fetchWeatherData(for: searchText, apiKey: apiKey)
            fetchWeatherForecastData(for: searchText, apiKey: apiKey)
            searchBar.text = ""
        } else {
            print("API 키를 가져올 수 없습니다.")
        }
    }

    // 사용자가 검색 바의 취소 버튼을 눌렀을 때 호출되는 메서드
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        // 검색 바 관련 설정 초기화 등 필요한 작업 수행
    }

    // API에서 날씨 정보를 가져오는 함수
    func fetchWeatherData(for location: String, apiKey: String) {
        let input = WeatherAPIInput(q: location, appid: apiKey)
        let urlString = "https://api.openweathermap.org/data/2.5/weather"
        
        AF.request(urlString, method: .get, parameters: input, encoder: URLEncodedFormParameterEncoder.default).responseDecodable(of: WeatherModel.self) { response in
            switch response.result {
            case .success(let weatherModel):
                print(weatherModel)
                self.weatherData.append(weatherModel) // 날씨 정보를 배열에 추가
                DispatchQueue.main.async {
                    self.tableView.reloadData() // TableView 업데이트
                }
            case .failure(let error):
                // 에러 처리
                print(error)
            }
        }
    }
    
    func fetchWeatherForecastData(for location: String, apiKey: String) {
        let input = WeatherAPIInput(q: location, appid: apiKey)
        let urlString = "https://api.openweathermap.org/data/2.5/forecast"
        
        AF.request(urlString, method: .get, parameters: input, encoder: URLEncodedFormParameterEncoder.default).responseDecodable(of: WeatherForecastModel.self) { response in
            switch response.result {
            case .success(let weatherForecastModel):
                print(weatherForecastModel)
                // 각 지역별로 내일 날씨 정보를 딕셔너리에 저장
                self.weatherForecastData[location] = weatherForecastModel
                DispatchQueue.main.async {
                    self.tableView.reloadData() // TableView 업데이트
                }
            case .failure(let error):
                // 에러 처리
                print(error)
            }
        }
    }
    
    func translateWeatherDescription(_ englishDescription: String) -> String {
        let translations: [String: String] = [
            "clear sky": "맑음",
            "few clouds": "구름 조금",
            "scattered clouds": "구름 낌",
            "broken clouds": "조각 구름",
            "overcast clouds": "흐림",
            "light rain": "약한 비",
        ]

        if let translatedDescription = translations[englishDescription] {
            return translatedDescription
        } else {
            // 매핑된 값이 없을 경우, 기본값 반환
            return englishDescription
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count // 날씨 정보 배열의 개수를 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell
        else {
            return UITableViewCell()
        }
        let weatherModel = weatherData[indexPath.row]
        // 섭씨 온도로 변환
        let maxTemp = String(format: "%.0f", weatherModel.main.temp_max - 273.15)
        let minTemp = String(format: "%.0f", weatherModel.main.temp_min - 273.15)
        let currentTemp = String(format: "%.0f", weatherModel.main.temp - 273.15)
        
        cell.locationLabel.text = weatherModel.name
        cell.locationLabel.text = weatherModel.name
        cell.maxTempLabel.text = "최고: \(maxTemp)°"
        cell.minTempLabel.text = "최저: \(minTemp)°"
        cell.tempLabel.text = "\(currentTemp)°"
        
        cell.locationLabel.textColor = .white
        cell.maxTempLabel.textColor = .white
        cell.minTempLabel.textColor = .white
        cell.tempLabel.textColor = .white
        
        // 시간대에 따라 배경색 변경
        let currentTime = Date() // 현재 시간
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentTime)
        
        if hour < 12 && hour > 6 {
            // 오전일 경우
            cell.backgroundView = UIImageView(image: UIImage(named: "morning"))
        } else {
            // 오후일 경우
            cell.backgroundView = UIImageView(image: UIImage(named: "afternoon"))
        }
        
        // 내일 날짜 가져오기
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: currentTime) ?? currentTime
        
        // 내일 날짜 문자열 만들기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let tomorrowDateString = dateFormatter.string(from: tomorrow)
        
        let location = weatherModel.name
        
        // 내일 날씨 정보 가져오기
        if let forecastModel = weatherForecastData[location] {
            let tomorrowWeather = forecastModel.list.filter { $0.dt_txt.contains(tomorrowDateString) }
            if let weatherInfo = tomorrowWeather.first {
                let maxTemperature = String(format: "%.0f", weatherInfo.main.temp_max - 273.15) // 섭씨 온도로 변환
                if let weatherDescription = weatherInfo.weather.first?.description {
                    let translatedDescription = translateWeatherDescription(weatherDescription)
                    cell.tomorrowWeatherLabel.text = translatedDescription
                    cell.tomorrowTempLabel.text = ", 최고 기온 \(maxTemperature)°"
                    cell.tomorrowWeatherLabel.textColor = .white
                    cell.tomorrowTempLabel.textColor = .white
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
