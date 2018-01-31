//
//  CompressorViewController+Compression.swift
//  Compressor
//
//  Created by Merrick Sapsford on 20/01/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

internal extension CompressorViewController {
    
    func updateCompression(for scrollOffset: CGPoint,
                           from viewController: UIViewController) {
        guard viewController === self.currentViewController else {
            return
        }
        
        let headerHeight = headerView.bounds.height
        headerTopPin.constant = min(-(headerHeight + scrollOffset.y), 0.0)
    }
}
