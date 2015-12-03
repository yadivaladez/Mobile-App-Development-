//
//  TaskManager.swift
//  
//
//  Created by Yadira Valadez on 10/27/15.
//
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Name"
    var desc = "Description"
    var amount = "Amount"
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(name: String, desc: String, amount: String){
        tasks.append(task(name: name, desc: desc, amount:amount))
    }
}
