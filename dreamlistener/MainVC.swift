//
//  MainVC.swift
//  dreamlistener
//
//  Created by oscar ljungdahl on 2017-05-13.
//  Copyright © 2017 oskar ljungdahl. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        generatedTestData()
        attemtFetch()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return  cell
    }
    
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath){
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
        
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
                return sectionInfo.numberOfObjects
        
        }
          return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        
        return 0

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func attemtFetch() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do{
            try  controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType,newIndexPath: IndexPath?) {

        switch (type) {
            case.insert:
                if let indexPath = newIndexPath {
                 tableView.insertRows(at:  [indexPath], with: .fade)
            }
                break
        case.delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
                break
            
        case.update:
            if let indexPath = indexPath{
            let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
                break
        case.move:
            if let  indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at:[indexPath] , with: .fade)
            
            }
            break
        }
    }

    func generatedTestData() {
        let item = Item(context: context)
        item.title = "MCBPRO"
        item.price = 1800
        item.details = "ey jag behöver en ny dator så ge mig en bror"
        
        
        let item2 = Item(context: context)
        item2.title = "ratchet and clank"
        item2.price = 50
        item2.details = "jag vill lira tvspekl jy"
        
        let item3 = Item(context: context)
        item3.title = "drone"
        item3.price = 500
        item3.details = "ey jag behöver en drone"
        
        
        ad.saveContext()
    
    }

}
