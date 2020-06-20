//
//  Common.swift
//  SlackNewWorkspaceUI
//
//  Created by 요한 on 2020/06/19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

struct CommonUI {
    static let didChangeVCButtonText = "Create New Workspace"
    static let writeWorkspacePlaceholder = "Name your workspace"
    
    static let margin: CGFloat = 10
    static let titleFontSize: CGFloat = 37
    static let contantsFontSize: CGFloat = 20
    
    // Navigation
    static func navigationViewController() -> UIViewController {
        let nameWSViewController = NameWSViewController()
        let VC = UINavigationController(rootViewController: nameWSViewController)
        
        return VC
    }
    // UILabel
    static func contantsLabel(for uiView: UILabel, title: String?, fontColor: UIColor,  textAlignment: NSTextAlignment?, addView: UIView) {
        uiView.text = title ?? ""
        uiView.textAlignment = textAlignment ?? .center
        uiView.font = UIFont.boldSystemFont(ofSize: contantsFontSize - 5)
        uiView.textColor = fontColor
        
        addView.addSubview(uiView)
    }
    // UIButton
    static func defaultButton(for uiButton: UIButton, title: String, titleColor: UIColor, addView: UIView) {
        uiButton.setTitle(title, for: .normal)
        uiButton.layer.cornerRadius = 4
        uiButton.setTitleColor(titleColor, for: .normal)
        
        addView.addSubview(uiButton)
    }
    // UITextField
    static func defaultTextField(for uiTextField: UITextField, placeholder: String, textAlignment: NSTextAlignment, keyboardType: UIKeyboardType, addView: UIView) {
        uiTextField.placeholder = placeholder
        uiTextField.textAlignment = textAlignment
        uiTextField.keyboardType = keyboardType
        uiTextField.font = UIFont.boldSystemFont(ofSize: contantsFontSize)
        uiTextField.textColor = .black
        
        addView.addSubview(uiTextField)
    }
    // Animation
    static func showUpAnimation(for uiLabel: UILabel, showUPAnimationEnable: Bool) {
        if showUPAnimationEnable == true {
            UIView.animate(
                withDuration: 0.3,
                animations: (
                    {
                        uiLabel.transform = CGAffineTransform(translationX: 0, y: -20)
                        uiLabel.alpha = 1
                    }
                )
            )
        } else {
            UIView.animate(
                withDuration: 0.3,
                animations: (
                    {
                        uiLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                        uiLabel.alpha = 0
                    }
                )
            )
        }
    }
    
}


