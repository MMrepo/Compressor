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
    
    // MARK: Lifecycle

    open override func loadView() {
        super.loadView()
        
        automaticallyAdjustsChildViewInsets = false
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutHeaderComponents(in: view)

        embedBar(in: barContentView)
    }
    
    // MARK: Layout
    
    private func layoutHeaderComponents(in view: UIView) {
        
        view.addSubview(headerStackView)
        headerStackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        headerStackView.addArrangedSubview(headerContentView)
        headerStackView.addArrangedSubview(barContentView)
    }
}
