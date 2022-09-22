//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Yashin Zahar on 15.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var taskLabel: UILabel!
    var task = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task

    }

}
