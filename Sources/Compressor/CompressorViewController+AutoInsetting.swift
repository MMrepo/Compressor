//
//  CompressorViewController+AutoInsetting.swift
//  Compressor
//
//  Created by Merrick Sapsford on 17/01/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import AutoInsetter

internal extension CompressorViewController {
    
    func setNeedsAutoInsetUpdate(for childViewController: UIViewController?) {
        view.layoutIfNeeded()
        
        let headerInsets = UIEdgeInsets(top: headerView.bounds.height - viewLayoutInsets.top, left: 0.0, bottom: 0.0, right: 0.0)
        let allInsets = UIEdgeInsets(top: headerView.bounds.height, left: 0.0, bottom: 0.0, right: 0.0)
        
        let spec = CompressorInsetSpec(additionalRequiredInsets: headerInsets,
                                       allRequiredInsets: allInsets)
        autoInsetter.inset(childViewController, requiredInsetSpec: spec)
    }
}

private struct CompressorInsetSpec: AutoInsetSpec {
    
    var additionalRequiredInsets: UIEdgeInsets
    var allRequiredInsets: UIEdgeInsets
}

private extension UIViewController {
    
    var viewLayoutInsets: UIEdgeInsets {
        var layoutInsets: UIEdgeInsets = .zero
        if #available(iOS 11, *) {
            layoutInsets = view.safeAreaInsets
        } else {
            layoutInsets.top = topLayoutGuide.length
            layoutInsets.bottom = bottomLayoutGuide.length
        }
        return layoutInsets
    }
}
