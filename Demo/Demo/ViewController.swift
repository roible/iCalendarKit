//
//  ViewController.swift
//  Demo
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import UIKit
import iCalendarKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLocal()
    }

    func testLocal() {
//        let filePath = Bundle.main.path(forResource: "", ofType: "ics")!
        
        let fileNames = ["calendar", "Magadan", "totalTimeZone", "Gambier"]
        
        fileNames.forEach {
            let filePath = Bundle.main.path(forResource: $0, ofType: "ics")!
            
            do {
                let calendar = try XiCalendar(filePath: filePath)
                
                print(calendar)
                print(calendar.componentDescription())
            } catch let error as XiCalendar.InitialError {
                print(error)
            } catch {
                print(" some thing error")
            }
            
            print("=== === === === === === === === === === === === === === === === === === === === === ")
        }
        
    }
}

