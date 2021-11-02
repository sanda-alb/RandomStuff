//
//  SecondViewController.swift
//  RandomStuff
//
//  Created by TK_User on 01.11.2021.
//

import UIKit

class SecondViewController: UIViewController {

    private let label = UILabel()
    private let backButton = UIButton(type: .system)
    private let buttonImage = UIImage(systemName: "arrowshape.turn.up.left.fill" )
    var text = ""
    private var completionHandler: ((String) -> Void)?

    init(completionHandler: ((String) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        self.completionHandler = completionHandler
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Second view controller deinitialization")
    }
    
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
          backButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func  setupLayout() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .backgroundOrange
        
        label.textColor = .darkTextColor
        label.text = text
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 3
        label.textAlignment = .center
        
        backButton.setImage(buttonImage, for: .normal)
        backButton.tintColor = .buttonBackground
    }
    
    private func setupBehavior() {
        backButton.addTarget (
            self,
            action: #selector(showPrevious),
            for: .touchUpInside
        )
    }
    
    @objc private func showPrevious (sender: UIButton) {
        completionHandler?("Some data have been passed")
        dismiss(animated: true, completion: nil)
    }
}
