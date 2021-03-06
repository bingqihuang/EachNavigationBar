//
//  EachNavigationBar.swift
//  EachNavigationBar
//
//  Created by Pircate on 2018/3/28.
//  Copyright © 2018年 Pircate. All rights reserved.
//

import UIKit

open class EachNavigationBar: UINavigationBar {

    private var _alpha: CGFloat = 1
    
    /// Default is false. If set true, navigation bar will not restore when the UINavigationController call viewWillLayoutSubviews
    @objc open var isUnrestoredWhenViewWillLayoutSubviews = false
    
    @objc open var extraHeight: CGFloat = 0 {
        didSet {
            frame.size.height = 44.0 + extraHeight
        }
    }
    
    open override var alpha: CGFloat {
        get {
            return super.alpha
        }
        set {
            _alpha = newValue
            if let background = subviews.first {
                background.alpha = newValue
            }
        }
    }
    
    /// map to barTintColor
    open override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            barTintColor = newValue
        }
    }
    
    public convenience init(navigationItem: UINavigationItem) {
        self.init()
        setItems([navigationItem], animated: false)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let background = subviews.first else { return }
        background.alpha = _alpha
        background.frame = CGRect(x: 0,
                                  y: -UIApplication.shared.statusBarFrame.maxY,
                                  width: bounds.width,
                                  height: bounds.height + UIApplication.shared.statusBarFrame.maxY)
    }
}

extension UINavigationBar {
    
    @objc public func setShadowHidden(_ hidden: Bool) {
        let image = hidden ? UIImage() : nil
        shadowImage = image
        guard #available(iOS 11.0, *) else {
            setBackgroundImage(image, for: .default)
            return
        }
    }
}
