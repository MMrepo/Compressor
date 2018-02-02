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
        let offsetTopPin = -(headerHeight + scrollOffset.y)
        let limitedTopPin = max(offsetTopPin, -maximumHeaderTopPin(for: compression.boundary))
        headerTopPin.constant = min(limitedTopPin, 0.0)
    }
    
    private func maximumHeaderTopPin(for boundary: Compression.Boundary) -> CGFloat {
        let totalHeight = headerView.bounds.height
        var totalHeightWithSafeArea = totalHeight
        if #available(iOS 11, *) {
            totalHeightWithSafeArea -= view.safeAreaInsets.top
        }
        
        switch boundary {
        case .stopAt(let component):
            switch component {
                                
            case .tabBar:
                return totalHeightWithSafeArea - headerView.tabBarContainer.bounds.size.height
                
            default:
                return totalHeight
            }
        }
    }
}
