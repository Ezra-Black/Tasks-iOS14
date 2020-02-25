//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Joseph Rogers on 2/24/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var tasks: [Task] {
        let fetchedRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try CoreDataStack.shared.mainContext.fetch(fetchedRequest)
        } catch {
            NSLog("error fetching object data for tasks: \(error)")
            return []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row].name

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = tasks[indexPath.row]
            CoreDataStack.shared.mainContext.delete(task)
            do {
               try CoreDataStack.shared.mainContext.save()
               tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                CoreDataStack.shared.mainContext.reset()
                NSLog("error saving managed object context [MOC]: \(error)")
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskDetailSegue" {
            if let detailVC = segue.destination as? TaskDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    detailVC.task = tasks[indexPath.row]
                }
            }
        }
    }
    

}
