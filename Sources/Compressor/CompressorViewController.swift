//
//  CompressorViewController.swift
//  Compressor
//
//  Created by Merrick Sapsford on 12/11/2017.
//  Copyright © 2017 UI At Six. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import AutoInsetter
import PureLayout

open class CompressorViewController: TabmanViewController {
    
    // MARK: Properties
    
    internal let headerView = CompressorHeaderView()
    internal var headerTopPin: NSLayoutConstraint!
    
    private lazy var scrollObservationService = ScrollObservationService()
    internal lazy var autoInsetter = AutoInsetter()
    
    public var compression: Compression = .default
    
    // MARK: Lifecycle

    open override func loadView() {
        super.loadView()
        
        automaticallyAdjustsScrollViewInsets = false
        automaticallyAdjustsChildViewInsets = false
        
        scrollObservationService.add(listener: self)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutHeaderComponents(in: view)

        embedBar(in: headerView.tabBarContainer)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setNeedsAutoInsetUpdate(for: currentViewController)
    }
    
    // MARK: Layout
    
    private func layoutHeaderComponents(in view: UIView) {
        
        view.addSubview(headerView)
        headerTopPin = headerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)[0]
    }
    
    // MARK: PageboyViewControllerDelegate
    
    open override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                             willScrollToPageAt index: Int,
                                             direction: PageboyViewController.NavigationDirection,
                                             animated: Bool) {
        super.pageboyViewController(pageboyViewController,
                                    willScrollToPageAt: index,
                                    direction: direction,
                                    animated: animated)
        
        let newViewController = dataSource?.viewController(for: pageboyViewController, at: index)
        setNeedsAutoInsetUpdate(for: newViewController)
    }
    
    open override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                      didScrollToPageAt index: Int,
                                      direction: PageboyViewController.NavigationDirection,
                                      animated: Bool) {
        super.pageboyViewController(pageboyViewController,
                                    didScrollToPageAt: index,
                                    direction: direction,
                                    animated: animated)
        if let currentViewController = pageboyViewController.currentViewController {
            didMoveToNewChildViewController(currentViewController)
        }
    }
    
    open override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                             didReloadWith currentViewController: UIViewController,
                                             currentPageIndex: PageboyViewController.PageIndex) {
        super.pageboyViewController(pageboyViewController,
                                    didReloadWith: currentViewController,
                                    currentPageIndex: currentPageIndex)
        didMoveToNewChildViewController(currentViewController)
    }
}

// MARK: - Scroll Observation
extension CompressorViewController: ScrollObservationServiceListenable {
    
    private func didMoveToNewChildViewController(_ childViewController: UIViewController) {
        scrollObservationService.unregister(viewControllers: scrollObservationService.registrations)
        scrollObservationService.register(viewControllers: [childViewController])
    }
    
    func scrollObservationService(_ service: ScrollObservationService,
                                  didObserveOffsetChangeFor viewController: UIViewController,
                                  on scrollView: UIScrollView,
                                  contentOffset: CGPoint) {
        updateCompression(for: contentOffset, from: viewController)
    }
}
