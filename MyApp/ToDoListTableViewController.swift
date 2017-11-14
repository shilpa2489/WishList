//
// ToDoListTableViewController.swift
//  ToDoListApp
//
//  Created by Shilpa-CISPL on 14/11/17.
//  Copyright © 2017 Shilpa. All rights reserved.
//

import UIKit
import CoreData


@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController {
    var people: [NSManagedObject] = []

    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.source as! AddToDoViewController
       if let item: ToDoItem = source.toDoItem{
            self.tableView.reloadData()
      }
        
   
    }
    
    var toDoItems: NSMutableArray = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        if #available(iOS 10.0, *) {
            let managedContext =
                appDelegate.persistentContainer.viewContext
            //2
            let fetchRequest =
                NSFetchRequest<NSManagedObject>(entityName: "Person")
            
            //3
            do {
                people = try managedContext.fetch(fetchRequest)
                self.tableView.reloadData()
                print("DB vALUES--\(people)")
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        } else {
            // Fallback on earlier versions
        }
        
       
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
      //  loadInitialData()
       
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let person = people[indexPath.row]
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CustomEntityCell

            cell.itemNameCellLabel.text = person.value(forKeyPath: "itemName") as? String
            
            cell.quantityCellLabel.text = person.value(forKeyPath: "quantity") as? String
            return cell
    }
    
    func save(itemName: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        if #available(iOS 10.0, *) {
            let managedContext =
                appDelegate.persistentContainer.viewContext
            // 2
            let entity =
                NSEntityDescription.entity(forEntityName: "Person",
                                           in: managedContext)!
            
            let person = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
            
            // 3
            person.setValue(itemName, forKeyPath: "itemName")
            
            // 4
            do {
                try managedContext.save()
                people.append(person)
                print("SAVED")
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}




