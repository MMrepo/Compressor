//
//  Compression.swift
//  Compressor
//
//  Created by Merrick Sapsford on 02/02/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Foundation

public struct Compression {
    
    public var boundary: Boundary
}

public extension Compression {
    
    static var `default`: Compression {
        return Compression(boundary: .stopAt(component: .header))
    }
}

public extension Compression {
    
    public enum Boundary {
        
        public enum Component {
            case header
            case tabBar
            case none
        }
        
        case stopAt(component: Component)
    }
}
