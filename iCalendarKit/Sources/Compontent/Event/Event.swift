//
//  Event.swift
//  iCalendarKit
//
//  Created by roy on 2019/7/3.
//

import Foundation

public final class Event: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    
    public var startDate: Date?
    public var endDate: Date?
    public var stampDate: Date?
    public var createdDate: Date?
    public var lastModifiedDate: Date?
    public var sequences: Int?
    public var userID: String?
    public var location: String?
    public var summary: String?
    public var status: String?
    public var description: String?
    public var organizer: BridgePropertyType?
    public var attendees: BridgePropertyType?
    public var priority: Int?

    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = Foundation.TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    public init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public func configureProperties() {
        component.properties.forEach { property in
            
            switch (property.kind, property.valueInfo.kind) {
            case (.uID, .text):
                userID = property.valueInfo.value
            case (.class, .class):
                return
            case (.status, .status):
                return
            case (.transp, .transp):
                return
            case (.created, .dateTime):
                createdDate = dateFormatter.date(from: property.valueInfo.value)
            case (.dtStamp, .dateTime):
                stampDate = dateFormatter.date(from: property.valueInfo.value)
            case (.dtStart, .dateTime):
                startDate = dateFormatter.date(from: property.valueInfo.value)
            case (.dtEnd, .dateTime):
                endDate = dateFormatter.date(from: property.valueInfo.value)
            case (.summary, .text):
                summary = property.valueInfo.value
            case (.attendee, .calAddress):
                attendees = property
            case (.location, .text):
                location = property.valueInfo.value
            case (.priority, .integer):
                priority = Int(property.valueInfo.value)
            case (.sequence, .integer):
                sequences = Int(property.valueInfo.value)
            case (.organizer, .calAddress):
                organizer = property
            case (.xlicError, .text):
                return
            case (.x, .x):
                return
            default:
                return
            }
        }
    }
}
