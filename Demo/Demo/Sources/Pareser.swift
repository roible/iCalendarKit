//
//  Pareser.swift
//  Demo
//
//  Created by roy on 2019/7/10.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

class Parser {
//    let scaner: Scanner
    
    var componentContentStack = Stack<String>()
    
    init(_ content: String) {
        
        let formatedContent = content.trimmingCharacters(in: .whitespacesAndNewlines)
        parse(formatedContent)
    }
    
    public convenience init(withContent content: String) throws {
        let formatedContent = content.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !formatedContent.isEmpty else {
            throw InitialError.emptyContent
        }

        self.init(formatedContent)
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
    
    func parse(_ content: String) {
        let array = content.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        
        var correctArray: [String] = []
        var previousContainColonPice = ""
        
        array.forEach {
            if $0.contains(Mark.colon) {
                previousContainColonPice = $0
            } else {
                previousContainColonPice += $0
            }
        }
    }
}

extension Parser {
    public enum InitialError: Error {
        case incorrectPath
        case incorrectUrl
        case emptyContent
        case invalidatedFormatt
    }
}


