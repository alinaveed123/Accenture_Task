//
//  MyReceiptDetailViewController.swift
//  unionCoop
//
//  Created by Union Coop on 7/22/19.
//  Copyright © 2019 Union Coop. All rights reserved.
//

import UIKit
import ViewAnimator

class DetailViewController: UIViewController {

    var WeatherDetail:Weather!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblhumidity: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.title = "Details"
        SetupValues()
        // Do any additional setup after loading the view.
    }
   
    func SetupValues()  {
        
        
        lblName.text = WeatherDetail.name!
        lblDate.text = WeatherDetail.dates!
        lblDesc.text = WeatherDetail.descriptions
        lblTemp.text = WeatherDetail.temp
        lblhumidity.text = WeatherDetail.humidity!
        if let url = URL(string: "\(Environment.baseImageURL)\(WeatherDetail.icon!)@2x.png") {
            self.imgLogo.af.setImage(withURL: url)
        }
        let animation = AnimationType.zoom(scale: 0.5)
        view.animate(animations: [animation])
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
