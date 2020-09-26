//
//  OyakusokuTableViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/21.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class OyakusokuTableViewController: UITableViewController {
    
    
    var OyakusokuArray = [String]()
    override func viewWillAppear(_ animated: Bool) {
        //        UserDefaltsが空でなければ
        if UserDefaults.standard.object(forKey: "oyakusoku") != nil    {
            //            現在UserDfaltsに保存されている配列の値をresultに入れる
            OyakusokuArray = UserDefaults.standard.object(forKey: "oyakusoku")as! [String]
        }
        tableView.reloadData()
        
    }
    //viewDidloadは画面で一番最初に出る画面
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return OyakusokuArray.count
        
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OyakusokuCell", for: indexPath)
        
        cell.textLabel?.text = OyakusokuArray[indexPath.row]
        
        
        return cell
        
        
        
    }
    
    //スワイプしたセルを削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            OyakusokuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            print(OyakusokuArray)
            
            //    ゾンビ化を防ぐコード
            UserDefaults.standard.set(OyakusokuArray, forKey: "oyakusoku")}}
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
}
//
//// MARK: - Table view data source
//
//override func numberOfSections(in tableView: UITableView) -> Int {
//    // #warning Incomplete implementation, return the number of sections
//    return 0
//}
//
//override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    // #warning Incomplete implementation, return the number of rows
//    return 0
//}
//
///*
// override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
// let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
// // Configure the cell...
//
// return cell
// }
// */
//
///*
// // Override to support conditional editing of the table view.
// override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
// // Return false if you do not want the specified item to be editable.
// return true
// }
// */
//
///*
// // Override to support editing the table view.
// override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
// if editingStyle == .delete {
// // Delete the row from the data source
// tableView.deleteRows(at: [indexPath], with: .fade)
// } else if editingStyle == .insert {
// // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
// }
// }
// */
//
///*
// // Override to support rearranging the table view.
// override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
// }
// */
//
///*
// // Override to support conditional rearranging of the table view.
// override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
// // Return false if you do not want the item to be re-orderable.
// return true
// }
// */
//
///*
// // MARK: - Navigation
//
// // In a storyboard-based application, you will often want to do a little preparation before navigation
// override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// // Get the new view controller using segue.destination.
// // Pass the selected object to the new view controller.
// }
// */
//
//
