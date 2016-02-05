//
//  UIScrollViewExtension.swift
//  SrcollViewDemo
//
//  Created by EdenLi on 2016/2/4.
//  Copyright © 2016年 Darktt. All rights reserved.
//

import UIKit

public enum UIScrollOrientation
{
    case Vertical
    case Horizontal
}

public extension UIScrollView
{
    public class func scrollViewPaging(frame: CGRect) -> UIScrollView
    {
        let scrollView: UIScrollView = UIScrollView(frame: frame)
        scrollView.pagingEnabled = true
        
        return scrollView
    }
    
    public func addSubviews(views: Array<UIView>, scrollOrientation orientation: Set<UIScrollOrientation>)
    {
        for view in views {
            self.addSubview(view)
        }
        
        let vertical: Bool = orientation.contains(.Vertical)
        let horizonal: Bool = orientation.contains(.Horizontal)
        
        if let lastView = views.last {
            let width: CGFloat = horizonal ? CGRectGetMaxX(lastView.frame) : 0.0
            let height: CGFloat = vertical ? CGRectGetMaxY(lastView.frame) : 0.0
            
            let _contentSize: CGSize = CGSize(width: width, height: height)
            self.contentSize = _contentSize
        }
    }
}
