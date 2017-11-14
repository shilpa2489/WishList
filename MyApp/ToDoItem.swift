//
//  ToDoItem.swift
//  ToDoListApp
//
//  Created by Shilpa-CISPL on 14/11/17.
//  Copyright © 2017 Shilpa. All rights reserved.
//

import Foundation

class ToDoItem: NSObject{

    var itemName: NSString = ""
    var quantity: NSString = ""
    var completed: Bool = false
    var creationDate: Date = Date()
    
    init(name:String,quantity:String){
        self.itemName = name as NSString
        self.quantity = quantity as NSString
    }

}

