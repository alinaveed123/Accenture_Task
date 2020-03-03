//
//  OtherClassModel.swift
//  IMGenius
//
//  Created by Mac on 19/11/2019.
//  Copyright © 2019 Waqas Ali. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class ConvertObjectToCodabel : Object, Codable
{
    dynamic var coord : Coord?
    dynamic var weather = List<Weather>()
    dynamic var base : String?
    dynamic var main : Main?
    dynamic var visibility : Int?
    dynamic var wind : Wind?
    dynamic var clouds : Clouds?
    dynamic var dt : Int?
    dynamic var sys : Sys?
    dynamic var id : Int?
    dynamic var name : String?
    dynamic var cod : Int?

    enum CodingKeys: String, CodingKey {

        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
    
    convenience init(value: String) {
        self.init()
    }

   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        weather = try values.decodeIfPresent(List<Weather>.self, forKey: .weather)!
        base = try values.decodeIfPresent(String.self, forKey: .base)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
    }
    
    required init() {
        super.init()
    }
    
}


@objcMembers class Coord : Object, Codable {
    dynamic var  lon : Double?
    dynamic var  lat : Double?

    enum CodingKeys: String, CodingKey {

        case lon = "lon"
        case lat = "lat"
    }

    convenience init(value: String) {
        self.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
    }
    
    required init() {
        super.init()
    }
    
}


@objcMembers class Weather : Object, Codable {
    dynamic var  id : Int?
    dynamic var  main : String?
    dynamic var  descriptions : String?
    dynamic var  icon : String?
    dynamic var  feels_like : Double?
    dynamic var  dates : String?
    dynamic var  temp : String?
    dynamic var  name : String?
    dynamic var  humidity : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case main = "main"
        case descriptions = "description"
        case icon = "icon"
        case dates = "date"
        case temp = "temp"
        case feels_like = "feels_like"
        case name = "name"
        case humidity = "humidity"

    }
    
    convenience init(value: String) {
        self.init()
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
        descriptions = try values.decodeIfPresent(String.self, forKey: .descriptions)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        dates = try values.decodeIfPresent(String.self, forKey: .dates)
        temp = try values.decodeIfPresent(String.self, forKey: .temp)
        feels_like = try values.decodeIfPresent(Double.self, forKey: .feels_like)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
    }
    
    required init() {
        super.init()
    }
    
    
}


@objcMembers class Main : Object, Codable {
    dynamic var  temp : Double?
    dynamic var  pressure : Int?
    dynamic var  humidity : Int?
    dynamic var  temp_min : Double?
    dynamic var  temp_max : Double?

    enum CodingKeys: String, CodingKey {

        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
    }

    convenience init(value: String) {
        self.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        temp_min = try values.decodeIfPresent(Double.self, forKey: .temp_min)
        temp_max = try values.decodeIfPresent(Double.self, forKey: .temp_max)
    }
    
    required init() {
        super.init()
    }
    
}


@objcMembers class Wind : Object, Codable {
    dynamic var  speed : Double?
    dynamic var  deg : Int?

    enum CodingKeys: String, CodingKey {

        case speed = "speed"
        case deg = "deg"
    }
    
    convenience init(value: String) {
        self.init()
    }

   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
    }
    
    required init() {
        super.init()
    }
    
}


@objcMembers  class Clouds : Object, Codable {
    dynamic var  all : Int?

    enum CodingKeys: String, CodingKey {

        case all = "all"
    }

    convenience init(value: String) {
        self.init()
    }
   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(Int.self, forKey: .all)
    }
    
    required init() {
        super.init()
    }
    
}


@objcMembers class Sys : Object, Codable {
    dynamic var  type : Int?
    dynamic var  id : Int?
    dynamic var  message : Double?
    dynamic var  country : String?
    dynamic var  sunrise : Int?
    dynamic var  sunset : Int?

    convenience init(value: String) {
        self.init()
    }
    
    enum CodingKeys: String, CodingKey {

        case type = "type"
        case id = "id"
        case message = "message"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        message = try values.decodeIfPresent(Double.self, forKey: .message)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
    }
    
    required init() {
        super.init()
    }
    
}
