//
//  DogSelectionTableViewController.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class DogSelectionTableViewController: UITableViewController {
    
    var user: User!
    
    var selectedPaths: [IndexPath?]? = [] {
        didSet {
            var indexPaths: [IndexPath] = []
            for selectedIndexPath in selectedPaths! {
                if let selectedIndexPath = selectedIndexPath {
                    indexPaths.append(selectedIndexPath)
                }
            }
            if let oldValue = oldValue {
                for deselectedPath in oldValue {
                    if !indexPaths.contains(deselectedPath!){
                        indexPaths.append(deselectedPath!)
                    }
                }
            }
            tableView.performBatchUpdates({
                self.tableView.reloadRows(at: indexPaths, with: .none)
            })
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
                    DogSelectionTableViewCell.nib,
                    forCellReuseIdentifier: DogSelectionTableViewCell.identifier
        )
        tableView.register(
                    LockedDogTableViewCell.nib,
                    forCellReuseIdentifier: LockedDogTableViewCell.identifier
        )
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.myDogs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dog = user.myDogs[indexPath.row]
        if dog.unlocked {
            let cell = tableView.dequeueReusableCell(withIdentifier: DogSelectionTableViewCell.identifier, for: indexPath) as! DogSelectionTableViewCell
            cell.setInfo(dog: dog)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LockedDogTableViewCell.identifier, for: indexPath) as! LockedDogTableViewCell
            cell.setInfo(dog: dog)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView,
               heightForRowAt indexPath: IndexPath) -> CGFloat {

        return (100)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selection")
        user.myDogs[indexPath.row].unlocked = true
        if selectedPaths!.contains(indexPath) {
            selectedPaths!.remove(at: selectedPaths!.firstIndex(of: indexPath)!)
        } else {
            selectedPaths!.append(indexPath)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
