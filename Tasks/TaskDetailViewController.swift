//
//  TaskViewController.swift
//  Tasks
//
//  Created by Joseph Rogers on 2/24/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var task: Task?


    
    //MARK: - Outlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    
    //MARK: - View Lifescycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notesTextView.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //checks to see if task has a value when view is about to appear. lets us know if a task was passed into this controller.
        if task == nil {
            //if no task was passed in assume the user wants to create one. so add a button to the nav bar to save the users task.
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        }
        
    }
    
    //MARK: - Actions
    
    @objc func save() {
        guard let name = nameTextField.text,
            !name.isEmpty else {return}
            let notes = notesTextView.text
        
        let _ = Task(name: name, notes: notes)
        saveTask()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func saveTask() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
        NSLog("Error saving managed object Context \(error)")
        }
    }

}

