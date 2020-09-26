//
//  MochimonoViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/26.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit
import UserNotifications

class MochimonoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var titleArray = [String]()
    var dateArray = [Date]()
    
func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if UserDefaults.standard.object(forKey: "title") != nil{
        titleArray = UserDefaults.standard.object(forKey: "title") as! [String]
       }
        return titleArray.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if UserDefaults.standard.object(forKey: "title") != nil{
               
           titleArray = UserDefaults.standard.object(forKey: "title") as! [String]
                  
              }
           
              if UserDefaults.standard.object(forKey: "date") != nil{
           
               dateArray = UserDefaults.standard.object(forKey: "date") as! [Date]
           
               }
          
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           
           cell.textLabel?.text = titleArray[indexPath.row]
           
           let date = dateArray[indexPath.row]
           
           let formatter = DateFormatter()
           
           formatter.dateFormat = "yyyy/ MM/ dd"
           
           cell.detailTextLabel?.text = formatter.string(from: date)
           
           return cell
       
    
    }
    
    struct MyReminder {
        let title: String
        let date: Date
        let identifier: String
    }
    
    var models = [MyReminder]()
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        table.delegate = self
        table.dataSource = self

    }
    @IBAction func testButton(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success{
                self.scheduleTest()

                
            }else if error != nil{
                print("error occured")
            }
        })
        
    }
    func scheduleTest() {
        let content = UNMutableNotificationContent()
        content.title = "缶詰"
        content.sound = .default
        content.body = "消費期限が近づいています！確認して下さい！！"
        
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            if error != nil{
                print("error")
            }
        })
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? MochimonoAddViewController else{
            return
        }
        vc.title = "持ち物を追加"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion={title, body, Date in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
                let new = MyReminder(title: title, date: Date, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = "使用期限が近づいています！確認してください！"
                
                let targetDate = Date.addingTimeInterval(-60*60*24*30)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: targetDate), repeats: false)
                
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                    if error != nil{
                        print("error")
                    }
                })
                
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
     //消す
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            titleArray.remove(at: indexPath.row)
            dateArray.remove(at: indexPath.row)
            UserDefaults.standard.set(titleArray, forKey: "title")
            UserDefaults.standard.set(dateArray, forKey: "date")
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }

    }

}



    
