//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    private var uiChangeConstraint: NSLayoutConstraint?
    private var uiChangeAnimation: NSLayoutConstraint?
    private let writeWorkspace = UITextField()
    private let textFieldAnimationLabel = UILabel()
    
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: self,
            action: #selector(buttonPressed(_:))
        )
        button.tag = 1
        return button
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: #selector(buttonPressed(_:))
        )
        button.tag = 2
        return button
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set it to the left of the navigation bar.
        navigationItem.leftBarButtonItem = self.leftButton
        // Set it to the right of the navigation bar.
        navigationItem.rightBarButtonItem = self.rightButton
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = .white
        setupUI()
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.writeWorkspace.becomeFirstResponder()
    }
    
    // MARK: Layout
    
    private func setupUI() {
        let safeView = self.view.safeAreaLayoutGuide
        
        writeWorkspace.delegate = self
        // Attribute
        CommonUI.defaultTextField(
            for: writeWorkspace,
            placeholder: CommonUI.writeWorkspacePlaceholder,
            textAlignment: .left,
            keyboardType: .default,
            addView: view
        )
        // Layout
        writeWorkspace.translatesAutoresizingMaskIntoConstraints.toggle()
        NSLayoutConstraint.activate([
            writeWorkspace.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: CommonUI.margin),
            writeWorkspace.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: -CommonUI.margin),
        ])
        
        CommonUI.contantsLabel(
            for: textFieldAnimationLabel,
            title: CommonUI.writeWorkspacePlaceholder,
            fontColor: .black,
            textAlignment: .left,
            addView: view
        )
        textFieldAnimationLabel.translatesAutoresizingMaskIntoConstraints.toggle()
        NSLayoutConstraint.activate([
            textFieldAnimationLabel.topAnchor.constraint(equalTo: writeWorkspace.topAnchor, constant: 0),
            textFieldAnimationLabel.widthAnchor.constraint(equalTo: writeWorkspace.widthAnchor, multiplier: 1),
            textFieldAnimationLabel.leadingAnchor.constraint(equalTo: writeWorkspace.leadingAnchor)
        ])
        
        uiChangeConstraint = writeWorkspace.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
        uiChangeConstraint?.isActive = true
        
        setKeyboardEvent()
        
    }
    
    // MARK: Action
    
    @objc func keyboardWillAppear(_ sender: NotificationCenter) {
        uiChangeConstraint?.constant = -140
    }
    
    @objc func keyboardWillDisappear(_ sender: NotificationCenter) {
        uiChangeConstraint?.constant = 0
    }
    
    @objc func buttonPressed(_ sender: Any) {
        if let button = sender as? UIBarButtonItem {
            switch button.tag {
            case 1: // Change the background color to blue.
                self.view.backgroundColor = .blue
            case 2: // Change the background color to red.
                self.view.backgroundColor = .red
            default: print("error")
            }
        }
    }
}

// MARK: Extension

extension NameWSViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func setKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textFieldAnimationLabel.text?.isEmpty == false  {
            UIView.animate(
                withDuration: 0.3,
                animations: (
                    {
                        self.textFieldAnimationLabel.transform = CGAffineTransform(translationX: 0, y: -20)
                        self.textFieldAnimationLabel.alpha = 1
                    }
                )
            )
        } else {
            UIView.animate(
                withDuration: 0.3,
                animations: (
                    {
                        self.textFieldAnimationLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                        self.textFieldAnimationLabel.alpha = 0
                    }
                )
            )
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textFieldAnimationLabel.text == "" {
            print("isempty == true")
            self.textFieldAnimationLabel.alpha = 0
        } else {
            print("isempty == false")
            UIView.animate(
                withDuration: 0.3,
                animations: (
                    {
                        self.textFieldAnimationLabel.transform = CGAffineTransform(translationX: 0, y: -20)
                        self.textFieldAnimationLabel.alpha = 1
                    }
                )
            )
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(
            withDuration: 0.3,
            animations: (
                {
                    self.textFieldAnimationLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.textFieldAnimationLabel.alpha = 0
                }
            )
        )
    }
}
