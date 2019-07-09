//
//  ComponentProtocol.swift
//  Demo iOS
//
//  Created by roy on 2019/7/5.
//  Copyright © 2019 xianman. All rights reserved.
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
}

extension ComponentProtocol {
    public func addChild<N>(_ node: N) where N: ComponentProtocol {
        node.parent = self
        
        guard nil != lastChild else {
            firstChild = node
            lastChild = node
            return
        }
        
        lastChild?.rightBtother = node
        node.leftBrother = lastChild
        lastChild = node
    }
    
    public func removeChild<N>(_ node: N) where N: ComponentProtocol {
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
        
        var child: ComponentProtocol?

        subCompontents.forEach { subCompontent in
            let component = getComponent(for: subCompontent)
            
            component.parent = self

            if nil == child {
                self.firstChild = component
            }

            component.leftBrother = child
            child?.rightBtother = component
            child = component

            component.configure()
        }

        lastChild = child
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
    
    public func componentDescription(_ step: Int = 0) -> String {
        var childrenDescription = ""
        var currentChild = firstChild
        
        while let child = currentChild {
            childrenDescription += child.componentDescription(step + 1)
            currentChild = currentChild?.next
        }
        
        let stepString = (0...step).reduce("") { (result, _) in result + "    " }
        
        let propertyStep = stepString + "    "
        let propertiesDescription = properties.reduce("") {
            propertyStep + $0 + "\n" + propertyStep + $1.description
        }
        
        return #"""

        \#(stepString)-------- component: \#(kind)
        \#(stepString)properties: \#(propertiesDescription)
        \#(stepString)subComponents: \#(childrenDescription.isEmpty ? "none" : childrenDescription)
        
        """#
    }
}
