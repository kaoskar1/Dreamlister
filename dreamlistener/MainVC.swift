//
//  MainVC.swift
//  dreamlistener
//
//  Created by oscar ljungdahl on 2017-05-13.
//  Copyright © 2017 oskar ljungdahl. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

   
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 0
    }
   
    
    
}

