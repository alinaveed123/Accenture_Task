//
//  HistoryWeatherCell.swift
//  WeatherLogger
//
//  Created by ALI NAVEED on 02/03/2020.
//  Copyright © 2020 Personal   Ltd. All rights reserved.
//

import UIKit
import AlamofireImage

class HistoryWeatherCell: UITableViewCell {
      @IBOutlet weak var dateLabel: UILabel!
       @IBOutlet weak var tempLabel: UILabel!
       @IBOutlet weak var degreeLabel: UILabel!
       
       @IBOutlet weak var imag: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var model: Weather? {
           didSet {
               if let model = model {
                self.dateLabel.text = "\(model.dates!)"
                   self.tempLabel.text = "\(model.temp!)"
                   if let url = URL(string: "\(Environment.baseImageURL)\(model.icon!)@2x.png") {
                       self.imag.af.setImage(withURL: url)
                   }
               }
           }
       }

}
