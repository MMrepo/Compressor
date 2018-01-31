//
//  CompressorHeaderView.swift
//  Compressor
//
//  Created by Merrick Sapsford on 31/01/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import PureLayout

internal class CompressorHeaderView: UIView {
    
    // MARK: Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let viewControllerContainer = UIView()
    let tabBarContainer = UIView()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    // MARK: Lifecycle
    
    private func setUp() {
        
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
        
        stackView.addArrangedSubview(viewControllerContainer)
        stackView.addArrangedSubview(tabBarContainer)
    }
}
