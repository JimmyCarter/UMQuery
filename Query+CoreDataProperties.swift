//
//  Query+CoreDataProperties.swift
//  UMQuery
//
//  Created by umiao on 2017/5/15.
//  Copyright © 2017年 umiao. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Query {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Query> {
        return NSFetchRequest<Query>(entityName: "Query");
    }

    @NSManaged public var number: Int16
    @NSManaged public var title: String?
    @NSManaged public var options: String?
    @NSManaged public var chooseResult: String?
    @NSManaged public var type: String?

}
