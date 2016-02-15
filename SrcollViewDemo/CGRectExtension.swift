//
//  CGRectExtension.swift
//
//  Created by Darktt on 2015/8/13.
//  Copyright © 2015年 Darktt. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint
{
    public init(x: CGFloat? = 0.0, y: CGFloat? = 0.0)
    {
        self.x = x!
        self.y = y!
    }
    
    public init(x: Float? = 0.0, y: Float? = 0.0)
    {
        self.x = CGFloat(x!)
        self.y = CGFloat(y!)
    }
    
    public init(x: Double? = 0.0, y: Double? = 0.0)
    {
        self.x = CGFloat(x!)
        self.y = CGFloat(y!)
    }
    
    public init(x: Int? = 0, y: Int? = 0)
    {
        self.x = CGFloat(x!)
        self.y = CGFloat(y!)
    }
}

extension CGSize
{
    public init(width: CGFloat? = 0.0, height: CGFloat? = 0.0)
    {
        self.width = width!
        self.height = height!
    }
    
    public init(width: Float? = 0.0, height: Float? = 0.0)
    {
        self.width = CGFloat(width!)
        self.height = CGFloat(height!)
    }
    
    public init(width: Double? = 0.0, height: Double? = 0.0)
    {
        self.width = CGFloat(width!)
        self.height = CGFloat(height!)
    }
    
    public init(width: Int? = 0, height: Int? = 0)
    {
        self.width = CGFloat(width!)
        self.height = CGFloat(height!)
    }
    
    public static func squareSize(length: CGFloat) -> CGSize
    {
        return CGSize(width: length, height: length)
    }
}

extension CGRect
{
    public init(origin: CGPoint = CGPoint.zero, size: CGSize = CGSize.zero)
    {
        self.origin = origin
        self.size = size
    }
    
    public init(x: CGFloat? = 0.0, y: CGFloat? = 0.0, width: CGFloat? = 0.0, height: CGFloat? = 0.0)
    {
        self.origin = CGPoint(x: x!, y: y!)
        self.size = CGSize(width: width!, height: height!)
    }
    
    public init(x: Float? = 0.0, y: Float? = 0.0, width: Float? = 0.0, height: Float? = 0.0)
    {
        self.origin = CGPoint(x: x!, y: y!)
        self.size = CGSize(width: width!, height: height!)
    }
    
    public init(x: Double? = 0.0, y: Double? = 0.0, width: Double? = 0.0, height: Double? = 0.0)
    {
        self.origin = CGPoint(x: x!, y: y!)
        self.size = CGSize(width: width!, height: height!)
    }
    
    public init(x: Int? = 0, y: Int? = 0, width: Int? = 0, height: Int? = 0)
    {
        self.origin = CGPoint(x: x!, y: y!)
        self.size = CGSize(width: width!, height: height!)
    }
    
    // MARK: access shortcuts
    
    /// Alias for origin.x
    public var x: CGFloat
    {
        get {
            return self.origin.x
        }
        
        set {
            self.origin.x = newValue
        }
    }
    
    /// Alias for origin.y
    public var y: CGFloat
    {
        get {
            return self.origin.y
        }
        
        set {
            self.origin.y = newValue
        }
    }
    
    /// Alias for size.width
    public var width: CGFloat
    {
        get {
            return self.size.width
        }
        
        set {
            self.size.width = newValue
        }
    }
    
    /// Alias for size.height
    public var height: CGFloat
    {
        get {
            return self.size.height
        }
        
        set {
            self.size.height = newValue
        }
    }
    
    /// The center of rectangle
    public var center: CGPoint
    {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
    }
}