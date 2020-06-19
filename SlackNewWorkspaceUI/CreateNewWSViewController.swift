//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

final class CreateNewWSViewController: UIViewController {
    
    private let nameWSViewController = NameWSViewController()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemGray
    }
    
    // MARK: UI
    
    private func setupUI() {
        let safeView = self.view.safeAreaLayoutGuide
        
        // UIButton
        let didChangeVCButton = UIButton()
        didChangeVCButton.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        // Attribute
        CommonUI.defaultButton(
            for: didChangeVCButton,
            title: CommonUI.didChangeVCButtonText,
            titleColor: .systemBlue,
            addView: view
        )
        // Layout
        didChangeVCButton.translatesAutoresizingMaskIntoConstraints.toggle()
        NSLayoutConstraint.activate([
            didChangeVCButton.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: CommonUI.margin),
            didChangeVCButton.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: -CommonUI.margin),
            didChangeVCButton.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
        ])
    }
    
    // MARK: Action
    
    @objc private func didTabButton(_ sender: UIButton) {
        // 진동
        AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
            print("진동발생")
        }
        
            let VC = CommonUI.navigationViewController()
        VC.modalPresentationStyle = .fullScreen
//        nameWSViewController.modalTransitionStyle = .
        present(VC, animated: true)
        
        
        // 텍스트 크기
        //        ("ASDF" as NSString).size(withAttributes: <#T##[NSAttributedString.Key : Any]?#>)
    }
}
