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
import PureLayout

open class CompressorViewController: TabmanViewController {
    
    // MARK: Properties
    
    private var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    internal let headerContentView = UIView()
    private var barContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var compressorAdditionalInset: CGFloat = 0.0
    
    private lazy var scrollObservationService = ScrollObservationService()
    
    // MARK: Lifecycle

    open override func loadView() {
        super.loadView()
        
        scrollObservationService.add(listener: self)
        
        automaticallyAdjustsChildViewInsets = false
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutHeaderComponents(in: view)

        embedBar(in: barContentView)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: Layout
    
    private func layoutHeaderComponents(in view: UIView) {
        
        view.addSubview(headerStackView)
        headerStackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        headerStackView.addArrangedSubview(headerContentView)
        headerStackView.addArrangedSubview(barContentView)
    }
    
    // MARK: PageboyViewControllerDelegate
    
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
        // TODO - Handle offset changes
    }
}
