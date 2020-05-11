//
//  SignUpViewController.swift
//  Donga
//
//  Created by francis german on 2020-05-02.
//  Copyright © 2020 francis german. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Accept(_ sender: Any) {
        SVProgressHUD.show()
        if FirstName.text == "" || LastName.text == "" || Email.text == "" || Password.text == "" {
            SVProgressHUD.dismiss()
            displayAlert(title: "Missing Information", message: "You must enter all information")
            
        }
        
    
        if let email = Email.text{
            if let password = Password.text{
                Auth.auth().createUser(withEmail: email, password: password,completion: {(user,error) in
                    if error != nil {SVProgressHUD.dismiss();                        self.displayAlert(title: "Error", message: error!.localizedDescription)
                    
                        
                    }else{
                        SVProgressHUD.dismiss()
                        print("Sign up successful")
                        self.performSegue(withIdentifier: "moveToFeed", sender: nil)
                        
                        let uid = user!.user.uid
                        
                        
                        let ref = Database.database().reference(fromURL: "https://donga-f73e1.firebaseio.com/")
                        let UserRef = ref.child("users").child(uid)
                        let name = self.FirstName.text
                        let name2 = self.LastName.text
                        let email = self.Email.text
                        let password = self.Password.text
                        let values = ["name":String(name!) + String(name2!),"email":email,"password":password]
                        UserRef.updateChildValues(values as [AnyHashable : Any], withCompletionBlock: {(err, ref) in
                            if err != nil{
                                print("err")
                                return
                            }
                            print("success")
                            //}
                        })
                    }
                    
                })
            }
        
    }
        
    }
    func displayAlert(title:String, message:String){
        let Alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
        self.present(Alert,animated: true ,completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

