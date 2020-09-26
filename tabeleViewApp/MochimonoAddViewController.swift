//
//  MochimonoAddViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/26.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class MochimonoAddViewController: UIViewController,UITextFieldDelegate {
    var titleArray = [String]()
    var dateArray = [Date]()
    
    public var completion: ((String, String,Date) -> Void)?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           titleField.delegate = self
           
           navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(saveButton))

       }

       @IBOutlet var titleField: UITextField!
       
   
       @IBOutlet var datePicker: UIDatePicker!
       
       @objc func saveButton(_ sender: Any) {
           if let titleText = titleField.text, !titleText.isEmpty{
           let targetDate = datePicker.date
            let bodyText = String()
            
               
               
               completion?(titleText,bodyText, targetDate)
           }
        if UserDefaults.standard.object(forKey: "title") != nil{
            
            titleArray = UserDefaults.standard.object(forKey: "title") as! [String]
        }
        if UserDefaults.standard.object(forKey: "date") != nil{
        dateArray = UserDefaults.standard.object(forKey: "date") as! [Date]
        }
        
        let titleTable = titleField.text
        let dateTable = datePicker.date
        
        titleArray.append(titleTable!)
        dateArray.append(dateTable)
        
        UserDefaults.standard.set(titleArray, forKey: "title")
        UserDefaults.standard.set(dateArray, forKey: "date")
        
        
       }
    
//    キーボドを下げるコード

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
       return true
       }
       
       @IBOutlet var DateController: UISegmentedControl!
       
       
   }

    

