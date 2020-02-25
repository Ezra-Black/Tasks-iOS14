//
//  TaskCell.swift
//  Tasks
//
//  Created by Joseph Rogers on 2/25/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    //MARK: - Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }

    //Outlets
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    private func updateViews() {
        guard let task = task else { return }
        taskTitleLabel.text = task.name
    }
    
    
  
    //MARK: - Actions
    
    
    @IBAction func toggleCompleted(_ sender: Any) {
    }
    
}
