//
//  RealmHelper.swift
//  Outmix
//
//  Created by Bryan Ye on 26/06/2016.
//  Copyright © 2016 Bryan Ye. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addOutfit(outfit: Outfit) {
        let realm = try! Realm()
        
        try! realm.write() {
            realm.add(outfit)
        } 
    }
    
    static func deleteOutfit(outfit: Outfit) {
        let realm = try! Realm()
        
        try! realm.write() {
            realm.delete(outfit)
        }
    }
    
    static func retrieveOutfits() -> Results<Outfit> {
        let realm = try! Realm()
        return realm.objects(Outfit)
    }
    
    static func deleteEverything() {
        let realm = try! Realm()
        realm.beginWrite()
        realm.deleteAll()
        try! realm.commitWrite()
    }
}
