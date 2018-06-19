//
//  FacebookViewController.swift
//  FacebookShimmerGradient
//
//  Created by SEAN on 2018/6/18.
//  Copyright © 2018年 SEAN. All rights reserved.
//

import UIKit

class FacebookViewController: UIViewController{
    
    let backNewsFeedImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "fb_bg2")
        return iv
    }()
    
    let frontNewsFeedImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "fb_shimmer")
        return iv
    }()
    
    let gradientLayer = CAGradientLayer()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backNewsFeedImageView)
        backNewsFeedImageView.frame = view.frame
        
        view.addSubview(frontNewsFeedImageView)
        frontNewsFeedImageView.frame = view.frame
        
        setupGradientMask()
        handleMaskAnimation()
    }
    
    fileprivate func setupGradientMask(){
        gradientLayer.locations = [0, 0.4, 0.6, 1]
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.frame.size = CGSize(width: view.frame.height * 2, height: view.frame.height * 1.5)
        
        let angle = -75 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        frontNewsFeedImageView.layer.mask = gradientLayer
    }
    
    fileprivate func handleMaskAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -1.5 * view.frame.height
        animation.toValue = 0
        animation.repeatCount = Float.infinity
        animation.duration = 2
        
        gradientLayer.add(animation, forKey: "animationKey")
    }
    
}
