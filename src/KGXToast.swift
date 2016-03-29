//
//  KGXToast.swift
//  KGXToastDemo
//
//  Created by keygx on 2015/01/12.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

// Toast表示時間
enum ToastDisplayDuration : Int {
    case LengthShort
    case LengthNormal
    case LengthLong
    case LengthLongLong
    func getDurationTime() -> Double {
        switch self {
        case .LengthShort:
            return 2.0
        case .LengthNormal:
            return 3.5
        case .LengthLong:
            return 5.0
        case .LengthLongLong:
            return 8.0
        }
    }
}

private var baseWindow: UIWindow? = nil
private let windowWidthRatio: CGFloat = 0.9 // 90% of parent screen width
private let windowAlphaValue: CGFloat = 0.85
private let fontSize: CGFloat = 16.0

class KGXToast: UIWindow {

    class func showToastWithMessage(message: String, duration: ToastDisplayDuration) -> Void {
        
        // ステータスバーの向き(画面回転方向)
        let orientation:UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        // UIWindowの作成
        if baseWindow == nil {
            // baseWindowの設定
            switch orientation {
            case .LandscapeLeft:
                fallthrough
            case .LandscapeRight:
                // LandscapeLeft | LandscapeRight
                baseWindow = UIWindow(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.height, UIScreen.mainScreen().bounds.width))
            default:
                // Unknown | Portrait | PortraitUpsideDown
                baseWindow = UIWindow(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
            }
            baseWindow?.alpha = 0
            baseWindow?.userInteractionEnabled = false
            baseWindow?.windowLevel = UIWindowLevelNormal
        }
        
        // ToastViewのサイズ
        let toastViewRect:CGRect = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width * windowWidthRatio, UIScreen.mainScreen().bounds.height)
        
        // 1行の文字数
        let oneLineLength = floor(toastViewRect.width * windowWidthRatio / fontSize)
        
        // Labelの幅
        let labelWidth = oneLineLength * fontSize
        
        // Labelを作成する
        let messageLabel: UILabel = UILabel(frame: CGRectMake(10, 10, labelWidth, 10))
        messageLabel.backgroundColor = UIColor.clearColor()
        messageLabel.userInteractionEnabled = false
        messageLabel.text = message
        messageLabel.font = UIFont.systemFontOfSize(fontSize)
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.textAlignment = NSTextAlignment.Left
        messageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        messageLabel.numberOfLines = 0
        messageLabel.sizeToFit()
        
        // Toastを作成
        let toastView: UIView = UIView(frame: CGRectMake(0, 0, messageLabel.bounds.width + 10 + 10, messageLabel.bounds.height + 10 + 10+1))
        toastView.backgroundColor = UIColor.blackColor()
        toastView.userInteractionEnabled = false
        toastView.layer.cornerRadius = 9
        toastView.layer.borderColor = UIColor.grayColor().CGColor
        toastView.layer.borderWidth = 1
        toastView.layer.shadowOffset = CGSizeMake(1.5, 1.5)
        toastView.layer.shadowColor = UIColor.blackColor().CGColor
        toastView.layer.shadowOpacity = 0.4
        
        toastView.addSubview(messageLabel)
        
        // Toast用Viewの回転
        /**
        * Viewは自動的に回転しないので、画面の向きにあわせる。
        */
        var angle:CGFloat
        switch (orientation) {
        case .Portrait:
            // Portrait
            angle = CGFloat(0.0 * M_PI / 180.0)
        case .PortraitUpsideDown:
            // PortraitUpsideDown
            angle = CGFloat(180.0 * M_PI / 180.0)
        case .LandscapeLeft:
            // LandscapeLeft
            angle = CGFloat(-90.0 * M_PI / 180.0)
        case .LandscapeRight:
            // LandscapeRight
            angle = CGFloat(90.0 * M_PI / 180.0)
        default:
            // Unknown
            angle = CGFloat(0.0 * M_PI / 180.0)
        }
        toastView.transform = CGAffineTransformMakeRotation(angle)
        baseWindow?.addSubview(toastView)
        
        // センタリング
        toastView.center = baseWindow!.center
        
        // Toast表示
        self.show(duration.getDurationTime())
    }
    
    private class func show(duration: Double) -> Void {
        // baseWindowをkeyWindowにする
        baseWindow?.makeKeyWindow()
        
        // baseWindowを表示する
        baseWindow?.makeKeyAndVisible()
        
        // フェードイン
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                baseWindow?.alpha = windowAlphaValue
                return
            },
            completion:nil /*{
            (value: Bool) in
            }*/
        )
        
        // Toast表示時間
        let delay = duration * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.dismiss()
        })
    }
    
    private class func dismiss() -> Void {
        // フェードアウト
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                baseWindow?.alpha = 0
                return
            },
            completion: {
                (value: Bool) in
                baseWindow?.removeFromSuperview()
                baseWindow = nil
            }
        )
    }
}
