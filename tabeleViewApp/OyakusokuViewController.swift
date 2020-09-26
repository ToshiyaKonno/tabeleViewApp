//
//  OyakusokuViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/21.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class OyakusokuViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBOutlet weak var addTect: UITextField!
        
        
        var Oyakusokuarray2 = [String]()
        
        
        
        @IBAction func addButton(_ sender: Any) {
            
            print(Oyakusokuarray2)
             if UserDefaults.standard.object(forKey: "oyakusoku") != nil    {
                
            //            保存されている値をarrayの中に再度格納する
                
                Oyakusokuarray2 = UserDefaults.standard.object(forKey: "oyakusoku")as! [String]
                    }
            
            Oyakusokuarray2.append(addTect.text!)
           print(Oyakusokuarray2)
            
            
    //        保存する(配列の保存)
            UserDefaults.standard.set(Oyakusokuarray2, forKey: "oyakusoku")
            
            print(Oyakusokuarray2)
            
            self.navigationController?.popViewController(animated: true)
            
            
            
            
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addTect.text = addTect.text
        self.view.endEditing(true)
    }

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


