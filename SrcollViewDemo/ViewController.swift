//
//  ViewController.swift
//  SrcollViewDemo
//
//  Created by EdenLi on 2016/2/4.
//  Copyright © 2016年 Darktt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet var scrollView: UIScrollView?
    
    @IBOutlet var leftSubScrollView: UIScrollView?
    @IBOutlet var rightSubScrollView: UIScrollView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenRect: CGRect = UIScreen.mainScreen().bounds
        
        var leftViews = Array<UIView>()
        var rightViews = Array<UIView>()
        var views = Array<UIView>()
        var offsetX: CGFloat = 0
        let width: CGFloat = CGRectGetWidth(screenRect) / 2.0
        let height: CGFloat = CGRectGetWidth(screenRect) / 16.0 * 9.0
        
        for index in 1...5 {
            let frame = CGRect(x: offsetX, y: 0.0, width: width, height: height)
            var backgroundColor: UIColor = self.colorForIndex(index - 1)
            
            // Setup left view
            let leftView = UIView(frame: frame, backgrouneColor: backgroundColor)
            leftViews.append(leftView)
            
            backgroundColor = self.colorForIndex(index)
            
            // Setup center view
            let view = UIView(frame: frame, backgrouneColor: backgroundColor)
            views.append(view)
            
            backgroundColor = self.colorForIndex(index + 1)
            
            // Setup right view
            let rightView = UIView(frame: frame, backgrouneColor: backgroundColor)
            rightViews.append(rightView)
            
            offsetX += width
        }
        
        func SetupScrollViewParameterWithScrollView(_scrollView: UIScrollView, views: Array<UIView>) {
            _scrollView.pagingEnabled = true
            _scrollView.showsHorizontalScrollIndicator = false
            _scrollView.showsVerticalScrollIndicator = false
            _scrollView.delegate = self
            _scrollView.addSubviews(views, scrollOrientation: [.Horizontal])
        }
        
        if let leftSubScrollView = self.leftSubScrollView {
            SetupScrollViewParameterWithScrollView(leftSubScrollView, views: leftViews)
        }
        
        if let scrollView = self.scrollView {
            SetupScrollViewParameterWithScrollView(scrollView, views: views)
        }
        
        if let rightSubScrollView = self.rightSubScrollView {
            SetupScrollViewParameterWithScrollView(rightSubScrollView, views: rightViews)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation
    {
        return .Fade
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Other Methods -
    
    func colorForIndex(index: Int) -> UIColor
    {
        let color: UIColor
        
        switch index {
        case -4, 1, 6:
            color = UIColor.greenColor()
            
        case -3, 2, 7:
            color = UIColor.redColor()
            
        case -2, 3, 8:
            color = UIColor.orangeColor()
            
        case -1, 4, 9:
            color = UIColor.purpleColor()
            
        case 0 , 5, 10:
            color = UIColor.blueColor()
            
        default:
            color = UIColor.clearColor()
        }
        
        return color
    }
    
    func getOtherScrollViews(scrollView: UIScrollView) -> (UIScrollView, UIScrollView)
    {
        var scrollViews = (UIScrollView(), UIScrollView())
        
        switch scrollView
        {
        case self.leftSubScrollView!:
            scrollViews = (self.scrollView!, self.rightSubScrollView!)
            
        case self.scrollView!:
            scrollViews = (self.leftSubScrollView!, self.rightSubScrollView!)
            
        case self.rightSubScrollView!:
            scrollViews = (self.leftSubScrollView!, self.scrollView!)
            
        default:
            break
        }
        
        return scrollViews;
    }

    // MARK: - UIScrollViewDelegate -
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
        let scrollViews: (UIScrollView, UIScrollView) = self.getOtherScrollViews(scrollView)
        scrollViews.0.userInteractionEnabled = false
        scrollViews.1.userInteractionEnabled = false
        
        print("**** \(__FUNCTION__) ****")
        print("Given scrollView: \(scrollView)\n")
        print("Other scrollViews: .0 \(scrollViews.0), .1 \(scrollViews.1)\n")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let scrollViews: (UIScrollView, UIScrollView) = self.getOtherScrollViews(scrollView)
        
        scrollViews.0.contentOffset = scrollView.contentOffset
        scrollViews.1.contentOffset = scrollView.contentOffset
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        let scrollViews: (UIScrollView, UIScrollView) = self.getOtherScrollViews(scrollView)
        scrollViews.0.userInteractionEnabled = true
        scrollViews.1.userInteractionEnabled = true
        
        print("**** \(__FUNCTION__) ****")
        print("Given scrollView: \(scrollView)\n")
        print("Other scrollViews: .0 \(scrollViews.0), .1 \(scrollViews.1)\n")
    }
}

