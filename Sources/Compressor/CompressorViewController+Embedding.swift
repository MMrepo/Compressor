//
//  CompressorViewController+Embedding.swift
//  Compressor
//
//  Created by Merrick Sapsford on 24/11/2017.
//

import UIKit

public extension CompressorViewController {
    
    public func embedHeader(segueIdentifier: String) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    public func embedHeader(viewController: CompressorHeaderViewController) {
        let headerContainer = headerView.viewControllerContainer
        guard headerContainer.subviews.count == 0 else {
            fatalError("CompressorViewController already has an embedded header")
        }
        
        guard let view = viewController.view else {
            return
        }
        
        viewController.willMove(toParentViewController: self)
        headerContainer.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: headerContainer.topAnchor),
            view.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor)
            ])
        
        viewController.didMove(toParentViewController: self)
    }
}
