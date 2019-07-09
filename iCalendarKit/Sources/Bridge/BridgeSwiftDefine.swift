//
//  BridgeSwiftDefine.swift
//  Demo iOS
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public struct BridgeValueType: Codable {
    public private(set) var kind: ValueKind
    public private(set) var value: String
    
    public enum CodingKeys: String, CodingKey {
        case kind = "icalvalue_kind"
        case value
    }
}

public struct BridgeParameterType: Codable {
    public private(set) var kind: ParameterKind
    public private(set) var value: String
    
    public enum CodingKeys: String, CodingKey {
        case kind = "icalparameter_kind"
        case value
    }
    
    var description: String {
        return "--> \(kind): \(value)"
    }
}

public struct BridgePropertyType: Codable {
    public private(set) var kind: PropertyKind
    public private(set) var valueInfo: BridgeValueType
    public private(set) var parameters: [BridgeParameterType]?
    
    public enum CodingKeys: String, CodingKey {
        case kind = "icalproperty_kind"
        case valueInfo
        case parameters
    }
    
    func description(_ step: Int = 0, _ perStep: String = "    " ) -> String {
        let totalStep = (0...step + 1).reduce("", { (r, _)  in r + perStep })
        
        var result = "\n" + totalStep + "=> \(kind): \(valueInfo.value)"
        
        if let parameters = parameters {
            result += parameters.reduce("\n" + totalStep + "parameters:" + "\n", {
                $0 + (totalStep + perStep) + $1.description + "\n"
            })
        }
        return result
    }
}

public final class BridgeComponentType: Codable {
    public private(set) var kind: ComponentKind = .no
    public private(set) var properties: [BridgePropertyType] = []
    public private(set) var subComponents: [BridgeComponentType]?
    
    enum CodingKeys: String, CodingKey {
        case kind = "icalcomponent_kind"
        case properties
        case subComponents = "subcomponents"
    }
}
