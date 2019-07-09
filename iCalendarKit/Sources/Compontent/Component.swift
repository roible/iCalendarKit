//
//  Component.swift
//  Demo iOS
//
//  Created by roy on 2019/7/5.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public class Component: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    
    public required init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public func configureProperties() {
        
    }
}
