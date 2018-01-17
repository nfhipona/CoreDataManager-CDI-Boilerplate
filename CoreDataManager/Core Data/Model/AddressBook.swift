//
//  AddressBook.swift
//  CoreDataManager
//
//  Created by Neil Francis Hipona on 1/17/18.
//  Copyright © 2018 Neil Francis Hipona. All rights reserved.
//

import Foundation
import CoreData

extension AddressBook {
    
    /*
     * on.success (true, [AddressBook]) | on.fail (false, [])
     */
    class func items(withPredicate predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, fetchLimit: Int = 0) -> (success: Bool, items: [CartProduct]) {
        
        let request: NSFetchRequest<AddressBook> = fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = fetchLimit

        guard let result = CoreDataManager.shared.executeFetchRequest(request as! NSFetchRequest<NSFetchRequestResult>) as? [CartProduct] else { return (false, []) }
        return (true, result)
    }
}
