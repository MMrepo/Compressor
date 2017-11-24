//
//  ViewController.swift
//  Compressor-Example
//
//  Created by Merrick Sapsford on 12/11/2017.
//  Copyright © 2017 UI At Six. All rights reserved.
//

import UIKit
import Compressor
import Pageboy

class ViewController: CompressorViewController {

    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        viewControllers = [
            storyboard.instantiateViewController(withIdentifier: "ChildViewController"),
            storyboard.instantiateViewController(withIdentifier: "ChildViewController"),
            storyboard.instantiateViewController(withIdentifier: "ChildViewController")
        ]
        
        bar.items = viewControllers.flatMap({ (viewController) -> Item? in
            let index = self.viewControllers.index(of: viewController)
            return Item(title: "Page \((index ?? 0) + 1)")
        })
        
        self.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

