//
//  onBoardViewController.swift
//  Etapas
//
//  Created by Agus Cahyono on 14/11/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit
import Foundation

public class OnBoardViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var buttonSkip: UIButton!
    
    public var slides: [Slide] = [];
    
    public func setup(_ scrollView: UIScrollView?, _ pageControl: UIPageControl?){
    
        guard let scrollView = scrollView else {return}
        guard let pageControl = pageControl else {return}
        scrollView.delegate = self
        
        self.scrollView = scrollView
        self.pageControl = pageControl
    
    }
    
    private func setupView(){
        guard let pageControl = pageControl else {return}
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
        
    }
    
    public func createSlides(slide: () -> [Slide]){
        slides = slide()
        setupView()
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        guard let scrollView = scrollView else {return}
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    private func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let pageControl = pageControl else {return}
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    private func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        // setup button
        let indexSelected = Int(pageIndex)
        
        if indexSelected == self.slides.count - 1 {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                
//                self.buttonSkip.titleLabel?.font = FontManager.boldFont(14)
                self.buttonSkip.setTitleColor(.white, for: .normal)
                self.buttonSkip.setTitle("START", for: .normal)
                self.buttonSkip.backgroundColor = UIColor.red
                
            }) { completed in
            }
        } else {
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                
//                self.buttonSkip.titleLabel?.font = FontManager.semiBoldFont(14)
                self.buttonSkip.setTitle("SKIP", for: .normal)
                self.buttonSkip.backgroundColor = UIColor.clear
                self.buttonSkip.setTitleColor(.red, for: .normal)
                
            }) { completed in
                
            }
            
        }
        
        
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        
        guard let pageControl = pageControl else {return}
        
        if(pageControl.currentPage == 0) {
            //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
            //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
            //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
