//
//  EnterPage.swift
//  Login
//
//  Created by Chanakya on 18/04/18.
//  Copyright © 2018 Chanakya. All rights reserved.
//

import UIKit

/*struct Origin : Decodable{
    let port_name = String()
}*/

class EnterPage: UIViewController, UIPickerViewDelegate, UITextFieldDelegate,UIPickerViewDataSource {
    

    
//Using a button
    @IBOutlet weak var btn: DLRadioButton!
    
   //using textbox for the dropdown
    @IBOutlet weak var textbox: UITextField!
    
    //@IBOutlet weak var textbox2: UITextField!
    
  //using pickerView for dropdown
    @IBOutlet weak var dropdown: UIPickerView!
    
    
    
    //@IBOutlet weak var dropdown2: UIPickerView!
    
    //var list = ["1","2","3","4"]
    //var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    //var Origins = [Origin]()
    var nameArray: [AnyObject] = []
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let url = URL(string:"http://arthainfosystems.com/Emuapic/Emuapi/emudropdowndatanetr")
        URLSession.shared.dataTask(with: url!){
            (Data, URLResponse,Error) in
            if let jsonObj = try? JSONSerialization.jsonObject(with: Data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "data")!)
                
                self.dropdown.delegate = self
                self.dropdown.dataSource = self

                
                //getting the avengers tag array from json and converting it to NSArray
                if let OriginArray = jsonObj!.value(forKey: "data") as? NSArray {
                    //looping through all the elements
                    for Origin in OriginArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = Origin as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "port_name") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)! as AnyObject)
                                DispatchQueue.main.async {
                                    
                                    self.dropdown.reloadAllComponents()
                                }
                                print(self.nameArray.count)
                                //NSLog(self.nameArray)
                                
                            }
                        }
                    }
                }
            }
    }
    }
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.nameArray.count
        }
    
    
    func pickerView(_ pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        
        self.view.endEditing(true)
        return self.nameArray[row] as? String
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    }



    
            /*if Error == nil{
                do{
                    self.Origins = try JSONDecoder().decode([Origin].self, from: Data!)
                    NSLog(String(describing: self.Origins))
                }catch {
                    NSLog("parse error")
                }
                DispatchQueue.main.async {
                    
                    self.dropdown.reloadAllComponents()
                }
            }
        }.resume()
        
    }*/
    /*func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag==1){
        return self.nameArray.count
        }else{
         return self.days.count}
    }
    */
    
    
   /* func pickerView(_ pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        
        if(pickerView.tag==1){
          self.view.endEditing(true)
        return self.nameArray[row]
        }else{
          self.view.endEditing(true)
        return self.days[row]
        }
    }
    }*/


   /* func pickerView(_ pickerView:UIPickerView, didSelectRow row:Int, inComponent component:Int){
        if(pickerView.tag==1){
            self.textbox.text = self.list[row]
            self.dropdown.isHidden = true
        }else{
            self.textbox2.text = self.days[row]
            self.dropdown2.isHidden = true
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField == self.textbox{
            self.dropdown.isHidden = false
        }
        if textField == self.textbox2{
            self.dropdown .isHidden = false
        }
        
 */

