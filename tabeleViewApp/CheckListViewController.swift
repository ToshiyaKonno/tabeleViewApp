//
//  CheckListViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/21.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class CheckListViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBOutlet weak var addTect: UITextField!
        
        
        var Checkarray = [String]()
        
        
        
        @IBAction func addButton(_ sender: Any) {
            
            print(Checkarray)
             if UserDefaults.standard.object(forKey: "Check") != nil    {
                
            //            保存されている値をarrayの中に再度格納する
                
                Checkarray = UserDefaults.standard.object(forKey: "Check")as! [String]
                    }
            
            Checkarray.append(addTect.text!)
           print(Checkarray)
            
            
    //        保存する(配列の保存)
            UserDefaults.standard.set(Checkarray, forKey: "Check")
            
            print(Checkarray)
            
            self.navigationController?.popViewController(animated: true)
            
        
    
 

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
}
