//
//  Sign-inViewController.swift
//  Donga
//
//  Created by francis german on 2020-05-03.
//  Copyright © 2020 francis german. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class Sign_inViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Sign_in(_ sender: Any) {
        SVProgressHUD.show()
        if Email.text == "" || Password.text == "" {
            SVProgressHUD.dismiss()
            displayAlert(title: "Missing Information", message: "You must enter all information")
        }
        
        if let email = Email.text{
            if let password = Password.text{
                Auth.auth().signIn(withEmail: email, password: password,completion: {(user,error) in
                    if error != nil {SVProgressHUD.dismiss();
                        self.displayAlert(title: "Error", message: error!.localizedDescription)
                        
                        
                    }else{
                        print("Sign in successful")
                        SVProgressHUD.dismiss()
                        self.performSegue(withIdentifier: "moveToFeed", sender: nil)
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
