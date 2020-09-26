//
//  lifeHuckViewController.swift
//  tabeleViewApp
//
//  Created by 金野利哉 on 2020/09/24.
//  Copyright © 2020 金野利哉. All rights reserved.
//

import UIKit

class lifeHuckViewController: UIViewController {

   

     var lifeHackArray = ["TWICE","ミナ","サナ","ナヨン","モモ","乳ニダ","ダヒョン","チェヨン","ツウィ","ジョンヨン"]
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         picker.dataSource = self
         picker.delegate = self
         
     }
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
         return lifeHackArray.count
     
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
         return lifeHackArray[row]
         
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         
         
         let image = UIImage(named : lifeHackArray[row])

         lifehackImage.image = image
         
     }
     
     @IBOutlet var picker: UIPickerView!

     @IBOutlet var lifehackImage: UIImageView!
    
    
    
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
