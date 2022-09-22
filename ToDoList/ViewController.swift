//
//  ViewController.swift
//  ToDoList
//
//  Created by Yashin Zahar on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlet
    @IBOutlet weak var homeTableView: UITableView!
    //MARK: Property
    private var arrayTask: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    //MARK: Action
    @IBAction func createNewTaskButton(_ sender: UIButton) {
        alert()
    }

    //MARK: Create alert new task
    func alert() {
        let alert = UIAlertController(title: "Enter text" , message: nil, preferredStyle: .alert)
        
        alert.addTextField { (text) in
            text.placeholder = "Text"
            guard let text = text.text else { return }
            if text.count != 0 {
                self.arrayTask.append(text)
            } else {
                return
            }
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            let tf = alert.textFields?.first
            if let newTask = tf?.text{
                self.arrayTask.insert(newTask, at: 0)
                self.homeTableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

//MARK: Extention Delegate and Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath)
        
        let task = arrayTask[indexPath.row]
        cell.textLabel?.text = task
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrayTask[sourceIndexPath.row]
        arrayTask.remove(at: sourceIndexPath.row)
        arrayTask.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayTask.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        vc.task = arrayTask[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

