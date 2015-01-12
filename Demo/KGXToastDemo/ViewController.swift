//
//  ViewController.swift
//  KGXToastDemo
//
//  Created by keygx on 2015/01/12.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    // Toast
    @IBAction func btnShortAction(sender: UIButton) {
        var mes = ".LengthShort(2.0sec)"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.LengthShort)
    }
    @IBAction func btnNormalAction(sender: UIButton) {
        var mes = ".LengthNormal(3.5sec)"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.LengthNormal)
    }
    @IBAction func btnLongAction(sender: UIButton) {
        var mes = ".LengthLong(5.0sec)\nいろはにほへとちりぬるをわかよたれそつねならむうゐのおくやまけふこえてあさきゆめみしゑひもせすん"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.LengthLong)
    }
    @IBAction func btnLongLongAction(sender: UIButton) {
        var mes = ".LengthLongLong(8.0sec)\nいろはにほへとちりぬるをわかよたれそつねならむうゐのおくやまけふこえてあさきゆめみしゑひもせすん"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.LengthLongLong)
    }
    
    // アラート
    @IBAction func btnOpenWindowAction(sender: UIButton) {
        // UIAlertControllerを作成する.
        let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .Alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
            println("Action OK!!")
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
    }
}

