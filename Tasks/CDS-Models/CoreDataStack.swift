//
//  CoreDataStack.swift
//  Tasks
//
//  Created by Joseph Rogers on 2/24/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    //static makes this the shared stack for all objects made off this. it's the singleton
    static let shared = CoreDataStack()
    //connecting to the core data stack from the Disk
    //lazy says this computed property will not be made until we actually access this.
    lazy var container: NSPersistentContainer = {
        //the name below should match the file name of the xcdatamodeld file exactly minus the extension.
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores \(error)")
            } else {
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
