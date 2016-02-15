//
//  UIViewExtension.swift
//  SrcollViewDemo
//
//  Created by EdenLi on 2016/2/4.
//  Copyright © 2016年 Darktt. All rights reserved.
//

import UIKit

public extension UIView
{
    public convenience init(frame:CGRect, backgrouneColor: UIColor)
    {
        self.init()
        
        self.frame = frame
        self.backgroundColor = backgrouneColor
    }
    
    public func addSubviews(views: Array<UIView>)
    {
        for view in views {
            self.addSubview(view)
        }
    }
    
    public func addSubviews(views: UIView ...)
    {
        self.addSubviews(views)
    }
}
