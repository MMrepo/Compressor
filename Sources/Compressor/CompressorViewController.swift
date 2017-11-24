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
        
    // MARK: Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutHeaderComponents(in: view)

        embedBar(in: barContentView)

        
        // TODO - Fix this in Tabman
        bar.appearance = TabmanBar.Appearance({ (appearance) in
            appearance.layout.extendBackgroundEdgeInsets = false
        })        
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11, *), additionalSafeAreaInsets.top < 300 {
            var additionalSafeAreaInsets = self.additionalSafeAreaInsets
            additionalSafeAreaInsets.top += 300
            self.additionalSafeAreaInsets = additionalSafeAreaInsets
        }
    }
    
    // MARK: Layout
    
    private func layoutHeaderComponents(in view: UIView) {
        
        view.addSubview(headerStackView)
        headerStackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        headerStackView.addArrangedSubview(headerContentView)
        headerStackView.addArrangedSubview(barContentView)
    }
}
