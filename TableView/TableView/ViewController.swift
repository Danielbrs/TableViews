//
//  ViewController.swift
//  TableView
//
//  Created by Daniel Boros / BBS2H20A on 08.11.21.
//

import UIKit

class ViewController: UIViewController {

    //Unser Datasource
    var games = ["Far Cry6", "Battlefield 2042", "God of War"]
    
    @IBOutlet weak var myTableView: UITableView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //Hinzufügen des Edit-Buttons
        navigationItem.rightBarButtonItem = editButtonItem
        
        //Titel für die View
        title = "Games"
        
    }


}

// Erweiterung unserer Klasse ViewController
extension ViewController: UITableViewDataSource{
    
    // Wieviele Zellen (Cells) sollen erstellt werden
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    //Wie sollen die Cells aussehen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        myCell.textLabel?.text = games{indexPath.row}
        
        return myCell
    }
    

    
}

// Erweiterung unserer Klasse ViewController
extension ViewController: UITableViewDelegate{
    
}
