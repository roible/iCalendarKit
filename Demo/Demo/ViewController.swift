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
    enum CalendarFile: String, CaseIterable {
        case calendar
//        case basic
//        case totalTimeZone
//        case universityFormatted
//        case university
        
        var path: String {
            return bundle.path(forResource: rawValue, ofType: "ics") ?? ""
        }
        
        var bundle: Bundle {
            return Bundle(for: ViewController.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLocal()
    }

    func testLocal() {
        CalendarFile.allCases.forEach {
            print("calendar file: \($0.rawValue).ics \n path: \($0.path)")
            do {
                let calendar = try iCalendarKit.Calendar(filePath: $0.path)
                print(calendar.description())
            } catch let error as iCalendarKit.Calendar.InitialError {
                print(error)
            } catch {
                print(" some thing error")
            }

            print("=== === === === === === === === === === === === === === === === === === === === === ")
        }
    }
}

