//
//  ScrollObservationService.swift
//  Compressor
//
//  Created by Merrick Sapsford on 03/01/2018.
//

import UIKit

internal class ScrollObservationService {
    
    private(set) lazy var registrations = [UIViewController]()
    
    // MARK: Registration
    
    func register(viewControllers: [UIViewController]) {
        viewControllers.forEach { (viewController) in
            guard self.registrations.contains(viewController) == false else {
                return
            }
            self.registrations.append(viewController)
            self.hook(registration: viewController)
        }
    }
    
    func unregister(viewControllers: [UIViewController]) {
        viewControllers.forEach { (viewController) in
            if let index = self.registrations.index(of: viewController) {
                self.unhook(registration: viewController)
                self.registrations.remove(at: index)
            }
        }
    }
    
    // MARK: Evaluation
    
    private func unhook(registration: UIViewController) {
        
    }
    
    private func hook(registration: UIViewController) {
        let viewController = registration
        viewController.view.scrollViewSubviews.forEach { (scrollView) in
            
        }
    }
}

private extension UIView {
    
    var scrollViewSubviews: [UIScrollView] {
        var scrollViews = [UIScrollView]()
        self.subviews.forEach { (subview) in
            if let scrollView = subview as? UIScrollView {
                scrollViews.append(scrollView)
            }
        }
        return scrollViews
    }
}
