//
//  FontManager.swift
//  Etapas
//
//  Created by Agus Cahyono on 14/11/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

struct FontManager {
    
    
    /// REGULAR FONT
    ///
    /// - Parameter size: font size set by parameter
    /// - Returns: uifont
    static  func regularFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Muli-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /// SEMIBOLD FONT
    ///
    /// - Parameter size: font size set by parameter
    /// - Returns: uifont
    static func semiBoldFont(_ size: CGFloat) -> UIFont {
       return UIFont(name: "Muli-SemiBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    /// LIGHT FONT
    ///
    /// - Parameter size: font size set by parameter
    /// - Returns: uifont
    static func lightFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Muli-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /// BOLD FONT
    ///
    /// - Parameter size: font size set by parameter
    /// - Returns: uifont
    static func boldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Muli-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    
}
