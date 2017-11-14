//
//  AddToDoViewController.swift
//  ToDoListApp
//
//  Created by Shilpa-CISPL on 14/11/17.
//  Copyright © 2017 Shilpa. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var toDoItem: ToDoItem?
    var toDoQuantity : ToDoItem?
    var people: [NSManagedObject] = []

    @IBOutlet var textfield : UITextField!
    
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet var doneButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if !(self.textfield.text?.isEmpty)!{
            
            if !((self.quantityText.text?.isEmpty)!){
                
            self.toDoItem = ToDoItem(name: self.textfield.text!, quantity: self.quantityText.text!)
            save(itemName: self.textfield.text!,quantity: self.quantityText.text!)
            
            }
        }
    }
    
    
    func save(itemName: String,quantity: String) {
        
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
            person.setValue(quantity, forKey: "quantity")
            
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

    
//    override func touchesBegan(_ touches: Set<NSObject>, with event: UIEvent) {
//        self.view.endEditing(true)
//    }


}

