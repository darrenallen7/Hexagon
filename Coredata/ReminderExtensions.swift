//
//  ReminderExtensions.swift
//  Hexagon
//
//  Created by Kieran Lynch on 17/09/2024.
//

import Foundation
import UniformTypeIdentifiers
import CoreData
import HexagonData

extension Reminder: @retroactive NSItemProviderWriting {
    public static var writableTypeIdentifiersForItemProvider: [String] {
        [UTType.hexagonReminder.identifier]
    }

    public func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let objectID = self.objectID.uriRepresentation().absoluteString
        let data = objectID.data(using: .utf8)
        completionHandler(data, nil)
        return nil
    }
}

extension Reminder {
    var tagsArray: [Tag] {
        let tagSet = tags as? Set<Tag> ?? []
        return Array(tagSet)
    }
    
    var photosArray: [ReminderPhoto] {
        let photoSet = photos as? Set<ReminderPhoto> ?? []
        return Array(photoSet)
    }
    
    var notificationsArray: [String] {
        return notifications?.components(separatedBy: ",").filter { !$0.isEmpty } ?? []
    }
}