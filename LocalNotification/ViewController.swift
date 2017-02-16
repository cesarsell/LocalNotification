//
//  ViewController.swift
//  LocalNotification
//
//  Created by Cesar Rioja Garcia on 18/01/17.
//  Copyright © 2017 Cesar Rioja Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionDate(_ sender: UIDatePicker) {
        
        NotificationManager.sharedNotificacionManager.scheduleNotification(at: sender.date, title: "My title", body: "The body")
    }


    
}

