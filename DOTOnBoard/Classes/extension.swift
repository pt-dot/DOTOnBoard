//
//  extensio.swift
//  DOTOnBoard
//
//  Created by Ilham Hadi Prabawa on 11/30/18.
//

import Foundation

extension UIView {
    open func addConstraintWithVisualFormat(format: String, views: UIView...){
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

extension UIViewController {
    open func addChildVC(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    open func remove(){
        guard parent != nil else {return}
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
