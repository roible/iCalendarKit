//
//  ComponentProtocol.swift
//  Demo iOS
//
//  Created by roy on 2019/7/5.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public protocol ComponentProtocol: class {
    var component: BridgeComponentType { get set }
    var parent: ComponentProtocol? { get set }
    var firstChild: ComponentProtocol? { get set }
    var lastChild: ComponentProtocol? { get set }
    var leftBrother: ComponentProtocol? { get set }
    var rightBtother: ComponentProtocol? { get set }
    
    init(_ component: BridgeComponentType)
    
    func configureProperties()
    func specialPropertyDescription(step: Int, perStep: String) -> String
}

extension ComponentProtocol {
    public func addChild(_ node: ComponentProtocol) {
        node.parent = self
        
        guard hasChildren else {
            firstChild = node
            lastChild = node
            return
        }
        
        node.leftBrother = lastChild
        lastChild?.rightBtother = node
        lastChild = node
    }
    
    public var hasChildren: Bool {
        return nil != firstChild
    }
    
    public func removeChild(_ node: ComponentProtocol) {
        node.leftBrother?.rightBtother = node.rightBtother
        node.rightBtother?.leftBrother = node.leftBrother
    }
    
    public var kind: ComponentKind {
        return component.kind
    }
    
    public var subCompontents: [BridgeComponentType]? {
        return component.subComponents
    }
    
    public var properties: [BridgePropertyType] {
        return component.properties
    }
}

extension ComponentProtocol {
    public func configure() {
        configureProperties()
        configureNodeChain()
    }
    
    public func configureNodeChain() {
        guard let `subCompontents` = subCompontents else { return }

        subCompontents.forEach { subCompontent in
            let component = getComponent(for: subCompontent)
            self.addChild(component)
            component.configure()
        }
    }

    func getComponent(for base: BridgeComponentType) -> ComponentProtocol {
        switch base.kind {
        case .vEvent:
            return Event(base)
        case .vTimeZone:
            return TimeZone(base)
        case .xDaylight:
            return TimeZoneDaylight(base)
        case .xStandard:
            return TimeZoneStandard(base)
        default:
            return Component(base)
        }
    }
}

extension ComponentProtocol {
    public var previous: ComponentProtocol? {
        return leftBrother
    }
    
    public var next: ComponentProtocol? {
        return rightBtother
    }
    
    public func description(_ step: Int = 0, _ perStep: String = "    ") -> String {
        // components
        var childrenDescription = ""
        var currentChild = firstChild
        
        while let child = currentChild {
            childrenDescription += child.description(step + 1)
            currentChild = currentChild?.next
        }
        
        let totalStep = (0...step).reduce("") { (r, _) in r + perStep }
        
        // property
        let propertyStep = totalStep + perStep
        let propertiesDescription = properties.reduce("") {
            propertyStep + $0 + $1.description(step, perStep)
        }
        
        let extraDescription = specialPropertyDescription(step: step, perStep: perStep)
        
        return #"""
        \#(totalStep)-- -- -- -- -- --
        \#(totalStep)component: \#(kind)
        \#(totalStep)properties: \#(propertiesDescription)
        \#(totalStep)extraDescription: \#(extraDescription)
        \#(totalStep)subComponents: \#(childrenDescription.isEmpty ? "none" : ("\n" + childrenDescription))
        
        """#
    }
    
    public func specialPropertyDescription(step: Int, perStep: String) -> String { return "" }
}
