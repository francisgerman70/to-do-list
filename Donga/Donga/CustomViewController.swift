//
//  CustomViewController.swift
//  Donga
//
//  Created by francis german on 2020-05-05.
//  Copyright © 2020 francis german. All rights reserved.
//

import UIKit

class CustomViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let chat = SnapsTableViewController()
        chat.tabBarItem.title = "chats"

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

}
