//
//  K.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/7/21.
//

import Foundation
import UIKit

final class K {

    static let shared = K()

    // MARK: - Initializers
    
    init() { }

    // MARK: - Safe Area Margins
    
    static func hasTopNotch() -> CGFloat {
        if #available(iOS 11.0,  *) {
            if #available(iOS 13.0, *) {
                let scene = UIApplication.shared.connectedScenes.first
                
                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    return sd.window?.safeAreaInsets.top ?? 0.0
                }
            }
            
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 20.0
        }
        
        return 20.0
    }
    
    static func hasBottomArea() -> CGFloat {
        if #available(iOS 11.0,  *) {
            if #available(iOS 13.0, *) {
                let scene = UIApplication.shared.connectedScenes.first
                
                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    return sd.window?.safeAreaInsets.bottom ?? 0.0
                }
            }
            
            return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0.0
        }
        
        return 0.0
    }

}
