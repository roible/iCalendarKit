//
//  BridgeSwiftDefine.swift
//  Demo iOS
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xianman. All rights reserved.
//

import Foundation

public struct BridgeValueType: Codable {
    var kind: ValueKind
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case kind = "icalvalue_kind"
        case value
    }
}

public struct BridgeParameterType: Codable {
    var kind: ParameterKind
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case kind = "icalparameter_kind"
        case value
    }
}

public struct BridgePropertyType: Codable {
    var kind: PropertyKind
    var valueInfo: BridgeValueType
    var parameters: [BridgeParameterType]?
    
    enum CodingKeys: String, CodingKey {
        case kind = "icalproperty_kind"
        case valueInfo
        case parameters
    }
    
    var description: String {
        return "=> \(kind): \(valueInfo.value)"
    }
}

public class BridgeComponentType: Codable {
    var kind: ComponentKind = .no
    var properties: [BridgePropertyType] = []
    var subComponents: [BridgeComponentType]?
    
    enum CodingKeys: String, CodingKey {
        case kind = "icalcomponent_kind"
        case properties
        case subComponents = "subcomponents"
    }
}
