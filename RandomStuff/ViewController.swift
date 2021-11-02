//
//  ViewController.swift
//  RandomStuff
//
//  Created by TK_User on 29.10.2021.
//

import SnapKit
import UIKit

final class ViewController: UIViewController {
    
    private let label = UILabel()
    private let textField = UITextField()
    private let editLabelBtn = UIButton(type: .system)
    private let nextPageBtn = UIButton(type: .system)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAll()
    }

    private func setupAll() {
        embedViews()
        setupLayout()
        setupAppereance()
        setupBehavior()
    }
    
    private func embedViews() {
        [ label,
          textField,
          editLabelBtn,
          nextPageBtn
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        label.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
        }
        
        textField.snp.makeConstraints{ make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        editLabelBtn.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        nextPageBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .backgroundOrange
        
        label.textColor = .darkTextColor
        label.text = "Some text"
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 3
        label.textAlignment = .center
        
        textField.backgroundColor = .textFieldBackground
        textField.textColor = .darkTextColor
        textField.placeholder = "Write something..."
        textField.layer.cornerRadius = .cornerR
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.leftViewMode = .always
        textField.leftView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 10,
                height: textField.frame.height
            )
        )
       
        editLabelBtn.backgroundColor = .buttonBackground
        editLabelBtn.setTitle("Done", for: .normal)
        editLabelBtn.layer.cornerRadius = .cornerR
        editLabelBtn.setTitleColor(.white, for: .normal)
        
        nextPageBtn.backgroundColor = .buttonBackground
        nextPageBtn.setTitle("Next page", for: .normal)
        nextPageBtn.layer.cornerRadius = .cornerR
        nextPageBtn.setTitleColor(.white, for: .normal)
    }
    
    private func setupBehavior() {
        editLabelBtn.addTarget (
            self,
            action: #selector(editLabel),
            for: .touchUpInside
        )
        
        nextPageBtn.addTarget(
            self,
            action: #selector(showNext),
            for: .touchUpInside
        )
    }
    
    @objc private func editLabel(sender: UIButton) {
        if textField.text != "" {
            label.text = textField.text
        } else {
            label.text = "Oops, it seems you didn't write anything yet"
        }
    }
    
    @objc private func showNext (sender: UIButton) {
        let nextPage = SecondViewController(completionHandler: { [weak self] data in
            print(data)
            self?.label.text = data
        })
        
        nextPage.modalPresentationStyle = .fullScreen
        nextPage.modalTransitionStyle = .coverVertical
        
        if let textToPass = label.text {
            nextPage.text = textToPass
        }
    
        self.present(nextPage, animated: true, completion: nil)
    }
}
