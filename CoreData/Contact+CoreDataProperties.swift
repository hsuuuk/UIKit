//
//  Contact+CoreDataProperties.swift
//  CoreData
//
//  Created by 심현석 on 2023/02/07.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var shortcutNumber: Int16

}

extension Contact : Identifiable {

}
