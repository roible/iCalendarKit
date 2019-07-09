//
//  ComponentBridgeManager.swift
//  Demo iOS
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

struct ComponentBridgeManager {
    static func parse(_ content: String) throws -> BridgeComponentType? {
        let bridge = ComponentBridge()
        
        guard let result = bridge.parse(withContent: content) as? [String: Any] else {
            return nil
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: result, options: [])
            return try JSONDecoder().decode(BridgeComponentType.self, from: jsonData)
        }
    }
}
