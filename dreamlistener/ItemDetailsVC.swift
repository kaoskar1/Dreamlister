//
//  ItemDetailsVC.swift
//  dreamlistener
//
//  Created by oscar ljungdahl on 2017-05-14.
//  Copyright © 2017 oskar ljungdahl. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detialsField: CustomTextField!
    
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        let store2 = Store(context: context)
//        store2.name = " Buy"
//        let store3 = Store(context: context)
//        store3.name = "Best "
//        let store4 = Store(context: context)
//        store4.name = "onOff"
//        let store5 = Store(context: context)
//        store5.name = "cdon"
//        let store6 = Store(context: context)
//        store6.name = "psStore"
//        ad.saveContext()
       
        
         getStores()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // hataAik
    }
    
    func  getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        } catch {
            
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = Item(context: context)
            if let title = titleField.text {
                item .title = title
        }
        
        if let price =  priceField.text {
           
            item.price = (price  as NSString).doubleValue
        }
        
        if let details = detialsField.text {
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
