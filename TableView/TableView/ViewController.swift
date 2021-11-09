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
        
        //leere UIView um die TabvleView zu "kürzen"
        myTableView.tableFooterView = UIView()
        
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        print("Set Editing")
        
        //Wenn Editing False ist, wird es auf True gesetzt und umgekehrt
        super.setEditing(!isEditing, animated: true)
        myTableView.setEditing(!myTableView.isEditing, animated: true)
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
        
        myCell.textLabel?.text = games[indexPath.row]
        
        return myCell
    }
    

    
}

// Erweiterung unserer Klasse ViewController
extension ViewController: UITableViewDelegate{
    
    //Funktion zum "Bewegen der Cell"
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //Konstante für die ausgewählte Cell
        let selectedGame = games[sourceIndexPath.row]
        
        //Funktion zum Löschen der Cell im Array
        games.remove(at: sourceIndexPath.row)
        
        //Funktion zum Einfügen des neuen Wertes im Array
        games.insert(selectedGame, at: destinationIndexPath.row)
    }
    
    //Funktion zum Löschen der Cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //Löschen aus dem Array
            games.remove(at: indexPath.row)
            
            
            //Löschen aus der TableView
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
