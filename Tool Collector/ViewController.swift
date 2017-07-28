//
//  ViewController.swift
//  Tool Collector
//
//  Created by Trent Stevens on 27/07/17.
//  Copyright © 2017 Trent Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var toolTableView: UITableView!
    
    var tools : [Tool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toolTableView.dataSource = self
        toolTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tools = context.fetch(Tool.fetchRequest())
            toolTableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tool = tools[indexPath.row]
        cell.textLabel?.text = tool.itemDescription
        cell.imageView?.image = UIImage(data: tool.itemPhoto! as Data)
        return cell
    }

}

