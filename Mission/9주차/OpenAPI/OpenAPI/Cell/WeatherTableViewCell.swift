//
//  WeatherTableViewCell.swift
//  OpenAPI
//
//  Created by 임수진 on 2023/12/07.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var tomorrowTempLabel: UILabel!
    @IBOutlet weak var tomorrowWeatherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        displayTime()
        layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayTime() {
        let formatter_time = DateFormatter()
        formatter_time.dateFormat = "HH:mm"
        timeLabel.text = formatter_time.string(from: Date())
        timeLabel.textColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 셀의 모서리를 둥글게 하기
        self.contentView.frame = self.bounds
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
    }
}
