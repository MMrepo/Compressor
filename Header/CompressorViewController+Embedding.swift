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
        guard headerContentView.subviews.count == 0 else {
            fatalError("CompressorViewController already has an embedded header")
        }
        
        guard let view = viewController.view else {
            return
        }
        let containerView = headerContentView
        
        viewController.willMove(toParentViewController: self)
        containerView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: containerView.topAnchor),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        viewController.didMove(toParentViewController: self)
    }
}
