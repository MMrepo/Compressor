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
    private var headerContentView: UIView = {
        let view = UIView()
        // TODO - Remove
        view.backgroundColor = .red
        view.autoSetDimension(.height, toSize: 300.0)
        return view
    }()
    private var barContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    // MARK: Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO - Do this properly
        view.addSubview(headerStackView)
        headerStackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)

        embedBar(in: barContentView)
        
        headerStackView.addArrangedSubview(headerContentView)
        headerStackView.addArrangedSubview(barContentView)
        
        // TODO - Fix this in Tabman
        bar.appearance = TabmanBar.Appearance({ (appearance) in
            appearance.layout.extendBackgroundEdgeInsets = false
        })
    }
}
