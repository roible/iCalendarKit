//
//  Calendar.swift
//  iCalendarKit
//
//  Created by roy on 2019/7/9.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public final class Calendar: ComponentProtocol {
    public var component: BridgeComponentType
    public var parent: ComponentProtocol?
    public var firstChild: ComponentProtocol?
    public var lastChild: ComponentProtocol?
    public var leftBrother: ComponentProtocol?
    public var rightBtother: ComponentProtocol?
    
    public init(_ component: BridgeComponentType) {
        self.component = component
    }
    
    public convenience init(withContent content: String) throws {
        let formatedContent = content.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !formatedContent.isEmpty else {
            throw InitialError.emptyContent
        }
        
        guard let calender = try ComponentBridgeManager.parse(formatedContent) else {
            throw InitialError.invalidatedFormatt
        }
        
        self.init(calender)
        configure()
    }
    
    public convenience init(url: URL) throws {
        guard
            let content = try? String(contentsOf: url, encoding: .utf8)
        else {
            throw InitialError.incorrectUrl
        }
        
        try self.init(withContent: content)
    }
    
    public convenience init(filePath path: String) throws {
        let url = URL(fileURLWithPath: path)
        
        do {
            try self.init(url: url)
        } catch let error as InitialError {
            throw error
        } catch {
            throw InitialError.incorrectPath
        }
    }
    
    public func configureProperties() {
        
    }
}

extension Calendar {
    public enum InitialError: Error {
        case incorrectPath
        case incorrectUrl
        case emptyContent
        case invalidatedFormatt
    }
}
