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
        case totalTimeZone
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
        
        testLocal()
        testParser()
    }

    func testParser() {
        try? Parser(filePath: CalendarFile.calendar.path)
    }
    
    var content: String {
        return #"""
        
        
        
        
        BEGIN:VCALENDAR
        METHOD:REQUEST
        PRODID:-//Tencent Corporation //Bizmail
        VERSION:2.0
        BEGIN:VTIMEZONE
        
        TZID:+8
        BEGIN:STANDARD
        TZOFFSETFROM: +0800
        TZOFFSETTO:+0800
        END:STANDARD
        BEGIN:DAYLIGHT
        TZOFFSETFROM:+0800
        TZOFFSETTO:+0800
        END:DAYLIGHT
        END:VTIMEZONE
        BEGIN:VEVENT
        UID:bizmailvip97t1561969299t21967
        CLASS:PUBLIC
        STATUS:TENTATIVE
        TRANSP:OPAQUE
        CREATED:20190701T162139
        DTSTAMP:20190701T162139
        DTSTART:20190701T170000
        DTEND:20190701T173000
        SUMMARY:wr发起会议0701
        ATTENDEE;CN=erchengsan;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-REQUEST;RSVP=TRUE:MAILTO:erchengsan@foxmail.com
        ATTENDEE;CN=erchengyi01;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-REQUEST;RSVP=TRUE:MAILTO:erchengyi01@163.com
        ATTENDEE;CN=shirley_wrong;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-REQUEST;RSVP=TRUE:MAILTO:shirley_wrong@sina.com
        ATTENDEE;CN=test18025341870;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-REQUEST;RSVP=TRUE:MAILTO:test18025341870@126.com
        LOCATION:这是地点0701
        PRIORITY:5
        SEQUENCE:0
        ORGANIZER;CN=王荣:MAILTO:shirleywang@xiaoman.cn
        DESCRIPTION:
        X-MICROSOFT-CDO-IMPORTANCE:1
        BEGIN:VALARM
        ACTION:DISPLAY
        TRIGGER:-PT15M
        DESCRIPTION:Reminder
        END:VALARM
        END:VEVENT
        END:VCALENDAR
        """#
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

