//
//  MainView.swift
//  CATransform3DAnimation
//
//  Created by XiaoQiang on 2017/7/26.
//  Copyright © 2017年 XiaoQiang. All rights reserved.
//

import UIKit

class MainView: UIView,CAAnimationDelegate {

  fileprivate var backgroundLayer_one:CAShapeLayer!
  fileprivate var gradientLayer1_one:CAGradientLayer!
  fileprivate var gradientLayer2_one:CAGradientLayer!
  fileprivate var colors_one:NSMutableArray!
  
  fileprivate var backgroundLayer_two:CAShapeLayer!
  fileprivate var gradientLayer1_two:CAGradientLayer!
  fileprivate var gradientLayer2_two:CAGradientLayer!
  fileprivate var colors_two:NSMutableArray!
  
  fileprivate var backgroundLayer_three:CAShapeLayer!
  fileprivate var gradientLayer1_three:CAGradientLayer!
  fileprivate var gradientLayer2_three:CAGradientLayer!
  fileprivate var colors_three:NSMutableArray!
  
  // 圆环宽度
  var width:CGFloat {
    didSet {
      backgroundLayer_one.lineWidth = width
      backgroundLayer_two.lineWidth = width
      backgroundLayer_three.lineWidth = width
    }
  }
  
  override init(frame: CGRect) {
    width = 10
    super.init(frame: frame)
    
    initOneSubLayers()
    initTwoSubLayers()
    initThreeSubLayers()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initOneSubLayers() -> Void {
    backgroundLayer_one = CAShapeLayer()
    gradientLayer1_one  =  CAGradientLayer()
    gradientLayer2_one  =  CAGradientLayer()
    
    // 添加渐变的颜色组合 一共75个颜色，想某种颜色占比大，就增加75中这种颜色的个数
    colors_one = NSMutableArray()
    var hue = 0
    //    for _ in 0...360 {
    //      if hue > 360 {
    //        break
    //      }
    //      let color:UIColor
    //      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    //      colors.add(color.cgColor)
    //      hue += 5
    //    }
    for _ in 0...40 {
      colors_one.add(UIColor.white.cgColor)
    }
    for _ in 0...160 {
      if hue > 160 {
        break
      }
      let color:UIColor
      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
      colors_one.add(color.cgColor)
      hue += 5
    }
    
    let la = circleShape_one()
    self.layer.addSublayer(la)
  }
  
  func initTwoSubLayers() -> Void {
    backgroundLayer_two = CAShapeLayer()
    gradientLayer1_two  =  CAGradientLayer()
    gradientLayer2_two  =  CAGradientLayer()
    
    // 添加渐变的颜色组合 一共75个颜色，想某种颜色占比大，就增加75中这种颜色的个数
    colors_two = NSMutableArray()
    var hue = 0
    //    for _ in 0...360 {
    //      if hue > 360 {
    //        break
    //      }
    //      let color:UIColor
    //      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    //      colors.add(color.cgColor)
    //      hue += 5
    //    }
    for _ in 0...30 {
      colors_two.add(UIColor.white.cgColor)
    }
    for _ in 0...160 {
      if hue > 160 {
        break
      }
      let color:UIColor
      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
      colors_two.add(color.cgColor)
      hue += 5
    }
    for _ in 0...10 {
      colors_two.add(UIColor.white.cgColor)
    }
    let la = circleShape_two()
    self.layer.addSublayer(la)
  }
  
  func initThreeSubLayers() -> Void {
    backgroundLayer_three = CAShapeLayer()
    gradientLayer1_three  =  CAGradientLayer()
    gradientLayer2_three  =  CAGradientLayer()
    
    // 添加渐变的颜色组合 一共75个颜色，想某种颜色占比大，就增加75中这种颜色的个数
    colors_three = NSMutableArray()
    var hue = 0
    //    for _ in 0...360 {
    //      if hue > 360 {
    //        break
    //      }
    //      let color:UIColor
    //      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    //      colors.add(color.cgColor)
    //      hue += 5
    //    }
    for _ in 0...160 {
      if hue > 160 {
        break
      }
      let color:UIColor
      color = UIColor(hue: 1.0 * CGFloat(hue) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
      colors_three.add(color.cgColor)
      hue += 5
    }
    for _ in 0...40 {
      colors_three.add(UIColor.white.cgColor)
    }
    let la = circleShape_three()
    self.layer.addSublayer(la)
  }

  
  func circleShape_one() -> CALayer {
    // 画圆
    let arcCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY);
    let radius:CGFloat = self.bounds.width / 4.0 - 5
    let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: .pi, endAngle: -.pi, clockwise: false)
    
    backgroundLayer_one.path = circlePath.cgPath;
    backgroundLayer_one.strokeColor = UIColor.white.cgColor
    backgroundLayer_one.fillColor = UIColor.clear.cgColor
    backgroundLayer_one.lineWidth = width
    
    // 方形光谱
    let gradientLayer_one = CALayer()
    gradientLayer1_one.frame = CGRect(x: 0, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer1_one.colors = colors_one as [AnyObject]
    //gradientLayer1.locations = [0.5,0.9,1]
    gradientLayer1_one.startPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer1_one.endPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer_one.addSublayer(gradientLayer1_one)
    //gradientLayer2.locations = [0.1,0.5,1]
    gradientLayer2_one.frame = CGRect(x: self.bounds.width/2, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer2_one.colors = colors_one as [AnyObject]
    gradientLayer2_one.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer2_one.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer_one.addSublayer(gradientLayer2_one)
    
    // 截取渐变层
    gradientLayer_one.mask = backgroundLayer_one //用progressLayer来截取渐变层
    
    // 光谱动画
    let colorArray = NSMutableArray(array: colors_one)
    let lastColor = colorArray.lastObject!
    colorArray.removeLastObject()
    
    
    colorArray.insert(lastColor, at: 0)
    
    let shiftedColors = NSArray(array: colorArray)
    gradientLayer1_one.colors = shiftedColors as [AnyObject]
    gradientLayer2_one.colors = shiftedColors as [AnyObject]
    let animation = CABasicAnimation(keyPath: "gavin_colors")
    animation.toValue = shiftedColors
    animation.duration = 0.02
    animation.fillMode = kCAFillModeForwards
    animation.delegate = self
    gradientLayer1_one.add(animation, forKey: "gavin_animateGradient")
    
    gradientLayer_one.transform = CATransform3DRotate(gradientLayer_one.transform, .pi*70/180.0, 1, 1, 0);
    gradientLayer_one.transform = CATransform3DRotate(gradientLayer_one.transform, -.pi*10/180.0, 0, 0, 1);
    
    return gradientLayer_one
  }
  
  func circleShape_two() -> CALayer {
    // 画圆
    let arcCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY);
    let radius:CGFloat = self.bounds.width / 4.0 - 5
    let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: .pi, endAngle: -.pi, clockwise: false)
    
    backgroundLayer_two.path = circlePath.cgPath;
    backgroundLayer_two.strokeColor = UIColor.white.cgColor
    backgroundLayer_two.fillColor = UIColor.clear.cgColor
    backgroundLayer_two.lineWidth = width
    
    // 方形光谱
    let gradientLayer_two = CALayer()
    gradientLayer_two.frame = CGRect(x: 135, y: self.bounds.midY - 3*radius - 25, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer1_two.frame = CGRect(x: 0, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer1_two.colors = colors_two as [AnyObject]
    //gradientLayer1.locations = [0.5,0.9,1]
    gradientLayer1_two.startPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer1_two.endPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer_two.addSublayer(gradientLayer1_two)
    //gradientLayer2.locations = [0.1,0.5,1]
    gradientLayer2_two.frame = CGRect(x: self.bounds.width/2, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer2_two.colors = colors_two as [AnyObject]
    gradientLayer2_two.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer2_two.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer_two.addSublayer(gradientLayer2_two)
    
    // 截取渐变层
    gradientLayer_two.mask = backgroundLayer_two //用progressLayer来截取渐变层
    
    // 光谱动画
    let colorArray = NSMutableArray(array: colors_two)
    let lastColor = colorArray.lastObject!
    colorArray.removeLastObject()
    
    
    colorArray.insert(lastColor, at: 0)
    
    let shiftedColors = NSArray(array: colorArray)
    gradientLayer1_two.colors = shiftedColors as [AnyObject]
    gradientLayer2_two.colors = shiftedColors as [AnyObject]
    let animation = CABasicAnimation(keyPath: "gavin_colors_")
    animation.toValue = shiftedColors
    animation.duration = 0.02
    animation.fillMode = kCAFillModeForwards
    let protocols = TwoProtocol()
    protocols.gradientLayer1_two = gradientLayer1_two
    protocols.gradientLayer2_two = gradientLayer2_two
    protocols.backgroundLayer_two = backgroundLayer_two
    protocols.colors_two = colors_two
    animation.delegate = protocols
    gradientLayer1_two.add(animation, forKey: "gavin_animateGradient_")
    
    gradientLayer_two.transform = CATransform3DRotate(gradientLayer_two.transform, .pi*70/180.0, -1, 1, 0);
    gradientLayer_two.transform = CATransform3DRotate(gradientLayer_two.transform, -.pi*10/180.0, 0, 0, 1);
    return gradientLayer_two
  }
  
  func circleShape_three() -> CALayer {
    // 画圆
    let arcCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY);
    let radius:CGFloat = self.bounds.width / 4.0 - 5
    let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: .pi, endAngle: -.pi, clockwise: false)
    
    backgroundLayer_three.path = circlePath.cgPath;
    backgroundLayer_three.strokeColor = UIColor.white.cgColor
    backgroundLayer_three.fillColor = UIColor.clear.cgColor
    backgroundLayer_three.lineWidth = width
    
    // 方形光谱
    let gradientLayer_three = CALayer()
    gradientLayer_three.frame = CGRect(x: 70, y: self.bounds.midY - 3*radius - 20, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer1_three.frame = CGRect(x: 0, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer1_three.colors = colors_three as [AnyObject]
    //gradientLayer1.locations = [0.5,0.9,1]
    gradientLayer1_three.startPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer1_three.endPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer_three.addSublayer(gradientLayer1_three)
    //gradientLayer2.locations = [0.1,0.5,1]
    gradientLayer2_three.frame = CGRect(x: self.bounds.width/2, y: self.bounds.midY - radius - 5, width: self.bounds.width/2, height: self.bounds.width);
    gradientLayer2_three.colors = colors_three as [AnyObject]
    gradientLayer2_three.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer2_three.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer_three.addSublayer(gradientLayer2_three)
    
    // 截取渐变层
    gradientLayer_three.mask = backgroundLayer_three //用progressLayer来截取渐变层
    
    // 光谱动画
    let colorArray = NSMutableArray(array: colors_three)
    let lastColor = colorArray.lastObject!
    colorArray.removeLastObject()
    
    
    colorArray.insert(lastColor, at: 0)
    
    let shiftedColors = NSArray(array: colorArray)
    gradientLayer1_three.colors = shiftedColors as [AnyObject]
    gradientLayer2_three.colors = shiftedColors as [AnyObject]
    let animation = CABasicAnimation(keyPath: "gavin_colors__")
    animation.toValue = shiftedColors
    animation.duration = 0.02
    animation.fillMode = kCAFillModeForwards
    let protocols = ThreeProtocol()
    protocols.gradientLayer1_three = gradientLayer1_three
    protocols.gradientLayer2_three = gradientLayer2_three
    protocols.backgroundLayer_three = backgroundLayer_three
    protocols.colors_three = colors_three
    animation.delegate = protocols
    gradientLayer1_three.add(animation, forKey: "gavin_animateGradient__")
    
    gradientLayer_three.transform = CATransform3DRotate(gradientLayer_three.transform, .pi*70/180.0, 1, 0, 0);
    return gradientLayer_three
  }

  
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

}

var i:CGFloat = 0.0
extension MainView {
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    // 颜色调整
    let colorArray = NSMutableArray(array: gradientLayer1_one.colors!)
    let lastColor = colorArray.lastObject!
    colorArray.removeLastObject()
    colorArray.insert(lastColor, at: 0)
    let shiftedColors = NSArray(array: colorArray)
    
    gradientLayer1_one.colors = shiftedColors as [AnyObject]
    gradientLayer2_one.colors = shiftedColors as [AnyObject]
    
    // 动画
    let animation = CABasicAnimation(keyPath: "gavin_colors")
    animation.toValue = shiftedColors
    animation.duration = 0.05
    animation.fillMode = kCAFillModeForwards
    animation.delegate = self
    gradientLayer1_one.add(animation, forKey: "gavin_animateGradient")
    
  }
}

class TwoProtocol: NSObject,CAAnimationDelegate {
  
  fileprivate var backgroundLayer_two:CAShapeLayer!
  fileprivate var gradientLayer1_two:CAGradientLayer!
  fileprivate var gradientLayer2_two:CAGradientLayer!
  fileprivate var colors_two:NSMutableArray!
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    
    // 颜色调整
    let colorArray_ = NSMutableArray(array: gradientLayer1_two.colors!)
    let lastColor_ = colorArray_.lastObject!
    colorArray_.removeLastObject()
    colorArray_.insert(lastColor_, at: 0)
    let shiftedColors_ = NSArray(array: colorArray_)
    
    gradientLayer1_two.colors = shiftedColors_ as [AnyObject]
    gradientLayer2_two.colors = shiftedColors_ as [AnyObject]
    
    // 动画
    let animation_ = CABasicAnimation(keyPath: "gavin_colors_")
    animation_.toValue = shiftedColors_
    animation_.duration = 0.05
    animation_.fillMode = kCAFillModeForwards
    animation_.delegate = self
    gradientLayer1_two.add(animation_, forKey: "gavin_animateGradient_")
    
  }
}

class ThreeProtocol: NSObject,CAAnimationDelegate {
  
  fileprivate var backgroundLayer_three:CAShapeLayer!
  fileprivate var gradientLayer1_three:CAGradientLayer!
  fileprivate var gradientLayer2_three:CAGradientLayer!
  fileprivate var colors_three:NSMutableArray!
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    
    // 颜色调整
    let colorArray__ = NSMutableArray(array: gradientLayer1_three.colors!)
    let lastColor__ = colorArray__.lastObject!
    colorArray__.removeLastObject()
    colorArray__.insert(lastColor__, at: 0)
    let shiftedColors__ = NSArray(array: colorArray__)
    
    gradientLayer1_three.colors = shiftedColors__ as [AnyObject]
    gradientLayer2_three.colors = shiftedColors__ as [AnyObject]
    
    // 动画
    let animation__ = CABasicAnimation(keyPath: "gavin_colors__")
    animation__.toValue = shiftedColors__
    animation__.duration = 0.05
    animation__.fillMode = kCAFillModeForwards
    animation__.delegate = self
    gradientLayer1_three.add(animation__, forKey: "gavin_animateGradient__")
    
  }
}
