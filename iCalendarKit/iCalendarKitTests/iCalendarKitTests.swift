//
//  iCalendarKitTests.swift
//  iCalendarKitTests
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import XCTest
@testable import iCalendarKit

class iCalendarKitTests: XCTestCase {
    enum CalendarFile: String {
        case calendar
        case basic
        case totalTimeZone
        case universityFormatted
        case university
        
        var path: String {
            return bundle.path(forResource: rawValue, ofType: "ics")!
        }
        
        var bundle: Bundle {
            return Bundle(for: iCalendarKitTests.self)
        }
    }

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalendarInitial() {
        let path = CalendarFile.calendar.path
        
        XCTAssertThrowsError(try iCalendarKit.Calendar(filePath: path + "error path"), "") { error in
            XCTAssertEqual(error as! iCalendarKit.Calendar.InitialError, .incorrectUrl)
        }
        
        let url = URL(fileURLWithPath: path + "error url")
        XCTAssertThrowsError(try iCalendarKit.Calendar(url: url), "") { error in
            XCTAssertEqual(error as! iCalendarKit.Calendar.InitialError, .incorrectUrl)
        }
        
        XCTAssertThrowsError(try iCalendarKit.Calendar(withContent: "   \n"), "") { error in
            XCTAssertEqual(error as! iCalendarKit.Calendar.InitialError, .emptyContent)
        }
        
        XCTAssertThrowsError(try iCalendarKit.Calendar(filePath: CalendarFile.university.path)) { error in
            XCTAssertEqual(error as! iCalendarKit.Calendar.InitialError, .invalidatedFormatt)
        }
        
        XCTAssertNoThrow(try iCalendarKit.Calendar(filePath: path))
    }
    
    func testCalendarComponent() {
        let calendar = try! iCalendarKit.Calendar(filePath: CalendarFile.calendar.path)
        
        XCTAssertEqual(calendar.kind, .vCalendar)
        XCTAssertTrue(calendar.hasChildren)
        XCTAssertNil(calendar.parent)
        XCTAssertNil(calendar.leftBrother)
        XCTAssertNil(calendar.rightBtother)
        XCTAssertEqual(calendar.firstChild!.kind, .vTimeZone)
        XCTAssertEqual(calendar.firstChild?.next?.kind, .vEvent)
        XCTAssertEqual(calendar.lastChild?.kind, .vEvent)
        XCTAssertNotNil(calendar.subCompontents)
        XCTAssertGreaterThan(calendar.properties.count, 1)
        
        XCTAssertNotNil(calendar.lastChild)
        let event = calendar.lastChild!
        XCTAssertNotNil(event)
        XCTAssertTrue(event.hasChildren)
        XCTAssertEqual(event.kind, .vEvent)
        XCTAssertEqual(event.parent?.kind, .vCalendar)
        
//        public var startDate: Date?
//        public var endDate: Date?
//        public var stampDate: Date?
//        public var createdDate: Date?
//        public var lastModifiedDate: Date?
//        public var sequences: Int?
//        public var userID: String?
//        public var location: String?
//        public var summary: String?
//        public var status: String?
//        public var description: String?
//        public var organizer: BridgePropertyType?
//        public var attendees: BridgePropertyType?
//        public var priority: Int?
        
        XCTAssertNil(calendar.parent)
        XCTAssertNil(calendar.leftBrother)
        XCTAssertNil(calendar.rightBtother)
        
        XCTAssertEqual(calendar.firstChild?.next?.kind, ComponentKind.vEvent)
        XCTAssertEqual(calendar.lastChild?.kind, ComponentKind.vEvent)
        XCTAssertNotNil(calendar.subCompontents)
        XCTAssertGreaterThan(calendar.properties.count, 1)
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
