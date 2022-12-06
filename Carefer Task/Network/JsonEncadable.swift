//
//  JsonEncadable.swift
//  Abdo
//
//  Created by Abdo on 7/14/22.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation

protocol JsonEncadable: Encodable {
    var json: [String: Any] { get }
}

extension JsonEncadable {
    var json: [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictEncoded = [String: Any]()
        mirror.children.forEach { child in
            dictEncoded[child.label!] = child.value
        }
        
        return dictEncoded
    }
}

struct EmptyJsonEncadable: JsonEncadable {
    
}
