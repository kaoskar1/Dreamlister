//
//  Item+CoreDataClass.swift
//  dreamlistener
//
//  Created by oscar ljungdahl on 2017-05-13.
//  Copyright © 2017 oskar ljungdahl. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()  
    }
}
