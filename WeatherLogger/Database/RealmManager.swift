//
//  RealmManager.swift
//  QualityRefree
//
//  Created by Muhammad Hassan Shafi on 17/01/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {

 static let shared = RealmManager()
        let realm = try! Realm()
        static let currentSchemaVersion: UInt64 = 1
        
        static func configureMigration() {
            let config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: { (migration, oldSchemaVersion) in
                if oldSchemaVersion < currentSchemaVersion {
                    print("\n\nMigration Performed\n\n")
                }
            })
            Realm.Configuration.defaultConfiguration = config
        }
        
        
        
        // Delete Database table
        
        func deleteDatabase() {
            try! realm.write({
                realm.deleteAll()
            })
        }
        
        // Delete Single Object
        
        func deleteObject(objs : Object) {
            try? realm.write ({
                realm.delete(objs)
            })
        }
        
        //Save array of objects to database
        
        func saveObjects(objs: Object) {
            try! realm.write ({
    //             If update = false, adds the object
                //realm.add(objs, update: false)
                realm.add(objs)
                
            })
        }
        
        // editing the object
        func editObjects(objs: Object) {
            try! realm.write ({
                // If update = true, objects that are already in the Realm will be
                // updated instead of added a new.
               // realm.add(objs, update: true)
                realm.add(objs)
            })
        }
        
        //Returs an array as Results<object>?
        func getObjects(type: Object.Type) -> Results<Object>? {
            return realm.objects(type)
        }
      
    
}
