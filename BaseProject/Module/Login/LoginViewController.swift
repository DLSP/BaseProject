//
//  ViewController.swift
//  LoginModel
//
//  Created by Scott on 16/6/14.
//  Copyright © 2016年 Scott. All rights reserved.
//

import UIKit

private let NUMBERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

/**
 登录界面
 */
class LoginViewController: UIViewController {
    ///账号。
    @IBOutlet weak  var accountTextField: UITextField!
    ///密码。
    @IBOutlet weak  var passwordTextField: UITextField!
    ///显示密码。
    @IBOutlet weak  var showPasswordBtn: UIButton!
    ///登录按钮。
    @IBOutlet weak  var loginBtn: UIButton!
    
    var account = ""
    var password = ""
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    ///显示or隐藏密码事件。
    @IBAction  func showPasswordBtn(sender: UIButton) {
        if sender.isSelected == false {
            sender.setImage(UIImage(named: ""), for: .normal)
//            passwordTextField.secureTextEntry = sender.selected
            sender.isSelected = true
        }else{
            sender.setImage(UIImage(named: ""), for: .normal)
//            passwordTextField.secureTextEntry = sender.selected
            sender.isSelected = false
        }
    }
    
    /**
     登录按钮事件。
     */
    @IBAction  func loginBtn(sender: UIButton) {
        self.view.endEditing(true)
        
        guard let account = accountTextField.text else{
            Common.showAlert(vc: self, msg: "账号不能为空")
            return
        }
        self.account = account
        self.account = Common.getTextByTrim(text: account)
        
        if account.isEmpty{
            Common.showAlert(vc: self, msg: "账号不能为空")
            return
        }
        
        guard let password = passwordTextField.text else{
            Common.showAlert(vc: self, msg: "密码不能为空")
            return
        }
        self.password = password
        self.password = Common.getTextByTrim(text: password)
        
        if password.isEmpty{
            Common.showAlert(vc: self, msg: "密码不能为空")
            return
        }
        
        var para = [String : AnyObject]()
        para["password"] = self.password as AnyObject?
        para["mobile"] = self.account as AnyObject?
        
        //进行网络数据申请操作
        
        //存储个人信息
        UserDefaults.standard.set("", forKey: "")
        
        //切换root 页面
        UIApplication.shared.windows[0].rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "")
    }
    
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate{
     func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == accountTextField{
            if !account.isEmpty{
                textField.text = account
            }
        }else{
            if !password.isEmpty{
                textField.text = password
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == accountTextField{
            account = textField.text ?? ""
        }else{
            password = textField.text ?? ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountTextField{
            passwordTextField.becomeFirstResponder()
        }else{
            accountTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.isEqual(accountTextField) {
            let filtered = Common.contrastInput(contrastType: NUMBERS, input: string)
            
            if string == filtered {
                return true
            } else {
                return false
            }
            
            //限制电话号码位数
//            if (textField.text?.characters.count)! < 11{
//                return true
//            } else if string == ""{
//                return true
//            } else {
//                return false
//            }
        } else {
            return true
        }
    }
}
