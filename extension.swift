//
//  extensio.swift
//  DOTOnBoard
//
//  Created by Ilham Hadi Prabawa on 11/30/18.
//

import Foundation

extension UIView {
    func addConstraintWithVisualFormat(format: String, views: UIView...){
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}
