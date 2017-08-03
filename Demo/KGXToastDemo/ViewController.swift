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
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    // Toast
    @IBAction func btnShortAction(_ sender: UIButton) {
        let mes = ".lengthShort(2.0sec)"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.lengthShort)
    }
    @IBAction func btnNormalAction(_ sender: UIButton) {
        let mes = ".lengthNormal(3.5sec)"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.lengthNormal)
    }
    @IBAction func btnLongAction(_ sender: UIButton) {
        let mes = ".lengthLong(5.0sec)\nいろはにほへとちりぬるをわかよたれそつねならむうゐのおくやまけふこえてあさきゆめみしゑひもせすん"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.lengthLong)
    }
    @IBAction func btnLongLongAction(_ sender: UIButton) {
        let mes = ".lengthLongLong(8.0sec)\nいろはにほへとちりぬるをわかよたれそつねならむうゐのおくやまけふこえてあさきゆめみしゑひもせすん"
        KGXToast.showToastWithMessage(mes, duration: ToastDisplayDuration.lengthLongLong)
    }
    
    // アラート
    @IBAction func btnOpenWindowAction(_ sender: UIButton) {
        // UIAlertControllerを作成する.
        let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        present(myAlert, animated: true, completion: nil)
    }
}

