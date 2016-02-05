//
//  UIEdgeInsetsExtension.swift
//  SrcollViewDemo
//
//  Created by EdenLi on 2016/2/4.
//  Copyright © 2016年 Darktt. All rights reserved.
//

import UIKit

public extension UIEdgeInsets
{
    public init(top: CGFloat? = 0.0, left: CGFloat? = 0.0, bottom: CGFloat? = 0.0, right: CGFloat? = 0.0)
    {
        self.top = top!
        self.left = left!
        self.bottom = bottom!
        self.right = right!
    }
}