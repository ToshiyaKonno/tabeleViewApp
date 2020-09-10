//
//  addListViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/06.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class addListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var addTect: UITextField!
    
    
    var array = [String]()
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
        print(array)
         if UserDefaults.standard.object(forKey: "add") != nil    {
            
        //            保存されている値をarrayの中に再度格納する
            
            array = UserDefaults.standard.object(forKey: "add")as! [String]
                }
        
        array.append(addTect.text!)
       print(array)
        
        
//        保存する(配列の保存)
        UserDefaults.standard.set(array, forKey: "add")
        
        print(array)
        
        self.navigationController?.popViewController(animated: true)
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
