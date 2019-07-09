//
//  TimeZone.swift
//  Demo iOS
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public final class TimeZone: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    public var tzID: String?

    public init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public func configureProperties() {
        let tzidProperty = component.properties.first { .tzID == $0.kind }
        if let tzid = tzidProperty {
            tzID = tzid.valueInfo.value
        }
    }
}

public final class TimeZoneStandard: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    public var tzOffsetFrom: String?
    public var tzOffsetTo: String?
    
    public init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public func configureProperties() {
        component.properties.forEach {
            switch $0.kind {
            case .tzOffsetFrom:
                tzOffsetFrom = $0.valueInfo.value
            case .tzOffsetTo:
                tzOffsetTo = $0.valueInfo.value
            default:
                break
            }
        }
    }
}

public final class TimeZoneDaylight: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    public var tzOffsetFrom: String?
    public var tzOffsetTo: String?
    
    public init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public func configureProperties() {
        component.properties.forEach {
            switch $0.kind {
            case .tzOffsetFrom:
                tzOffsetFrom = $0.valueInfo.value
            case .tzOffsetTo:
                tzOffsetTo = $0.valueInfo.value
            default:
                break
            }
        }
    }
}
