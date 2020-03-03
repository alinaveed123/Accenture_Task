//
//  DBManager.swift
//  QualityRefree
//
//  Created by Muhammad Hassan Shafi on 17/01/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager: NSObject {
    
    class func persistWeatherModel(realmObject : Weather){
        let realm = RealmManager.shared.realm
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    class func persisteWholeRecord(recordObject:  ConvertObjectToCodabel)
    {
        let realm = RealmManager.shared.realm
        try! realm.write {
            realm.add(recordObject)
        }
    }
    
    class func getWholeRecord() -> Results<ConvertObjectToCodabel>?
    {
        let realm = RealmManager.shared.realm
        let results = realm.objects(ConvertObjectToCodabel.self)
        if results.count > 0 {
            return results
        }
        else {
            return nil
        }
    }
    
    class func getWeatherModel() -> Results<Weather>? {
        let realm = RealmManager.shared.realm
        let results = realm.objects(Weather.self)
        if results.count > 0 {
            return results
        }
        else {
            return nil
        }
    }
    
    class func deleteWeatherObject()
    {
        let realm = RealmManager.shared.realm
        let results = realm.objects(Weather.self)
        if results.count > 0 {
            realm.delete(results)
        }
    }
    
    class func deleteWholeObject()
    {
        let realm = RealmManager.shared.realm
        let results = realm.objects(ConvertObjectToCodabel.self).last
        if(results != nil)
        {
            try! realm.write{
                realm.delete(results!)
            }
        }
    }

    class func deleteAllDatabase(){
        let realm = RealmManager.shared.realm
        try! realm.write {
          realm.deleteAll()
        }
    }
    
}
