//
//  Dish+CoreDataProperties.swift
//  Restaurant Rater
//
//  Created by user238354 on 4/4/23.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var dish: String?
    @NSManaged public var rating: Int16
    @NSManaged public var type: String?
    @NSManaged public var restaurant: Restaurant?

}

extension Dish : Identifiable {

}
