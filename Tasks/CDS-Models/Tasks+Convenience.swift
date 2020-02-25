//
//  Tasks+Convenience.swift
//  Tasks
//
//  Created by Joseph Rogers on 2/24/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

extension Task {
    @discardableResult convenience init(name: String,
                     notes: String? = nil,
                     priority: TaskPriority = .normal,
                     completed: Bool = false,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.priority = priority.rawValue //cause were saving it as a string
        self.completed = completed
        
    }
}
