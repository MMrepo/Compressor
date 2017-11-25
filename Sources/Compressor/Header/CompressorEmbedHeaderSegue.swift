//
//  CompressorEmbedHeaderSegue.swift
//  Compressor
//
//  Created by Merrick Sapsford on 24/11/2017.
//

import UIKit

public class CompressorEmbedHeaderSegue: UIStoryboardSegue {
 
    public override func perform() {
        guard let compressorViewController = source as? CompressorViewController else {
            fatalError("CompressorEmbedHeaderSegue can only be called from a CompressorViewController")
        }
        guard let headerViewController = destination as? CompressorHeaderViewController else {
            fatalError("CompressorViewController can only embed a CompressorHeaderViewController")
        }
        
        compressorViewController.embedHeader(viewController: headerViewController)
    }
}

