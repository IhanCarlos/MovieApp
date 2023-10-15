//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 03/06/23.
//

import UIKit

class RegisterViewController: UIViewController, CustomTextFieldLineDelegate {
    
    var viewModel: RegisterViewModel
    
    lazy var registerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backgroudImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "backgroundRegister")
        return img
    }()
    
    lazy var containerView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var containerTitle: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 22.5
        return stack
    }()
    
    lazy var logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "film")
        img.tintColor = .black
        img.clipsToBounds = true
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Movie "
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setBackgroundImage(UIImage(systemName: "arrow.uturn.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .ds(.purpleDark).withAlphaComponent(0.8)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        viewModel.popToLogin()
    }
    
    lazy var containerTextFields: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .white.withAlphaComponent(0.9)
        return view
    }()
    
    lazy var emailTextField: CustomTextFieldLine = {
        let textField = CustomTextFieldLine()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.title.text = "E-mail"
        textField.messageError.text = "invalid email"
        textField.delegate = self
        textField.validatorRegex = .email
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    lazy var passwordTextField: CustomTextFieldLine = {
        let textField = CustomTextFieldLine()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.autocorrectionType = .no
        textField.title.text = "Password"
        textField.messageError.text = "invalid password, the password must contain at least 8 characters containing letters and numbers"
        textField.delegate = self
        textField.validatorRegex = .password
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    lazy var registerButton: CustomButton = {
        let button = CustomButton(frame: .zero, style: .containedGeneral)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        customAlert(title: "Success!", mensagem: "account created successfully.")
        viewModel.popToLogin()
    }
    
    override func viewDidLoad() {
        setupView()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customTextFieldLineDidUpdateText(_ textFieldView: CustomTextFieldLine) {
        let isValid = validateTextFields()
        configButtonEnable(enable: isValid)
    }
    
    func validateTextFields() -> Bool {
        let emailIsValid = emailTextField.isValid
        let passwordValid = passwordTextField.isValid
        return emailIsValid && passwordValid
    }
    
    private func configButtonEnable(enable: Bool) {
        registerButton.isEnabled = enable
        if enable {
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.backgroundColor = .ds(.redLight)
        } else {
            registerButton.setTitleColor(.gray, for: .normal)
            registerButton.backgroundColor = .lightGray
        }
    }
}

extension RegisterViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(backgroudImage)
        view.addSubview(containerView)
        containerView.addSubview(containerTitle)
        containerTitle.addSubview(titleLabel)
        containerTitle.addSubview(logoImage)
        containerView.addSubview(backButton)
        containerView.addSubview(containerTextFields)
        containerTextFields.addSubview(emailTextField)
        containerTextFields.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
    }
    
    func setupConstraints() {
        backgroudImage.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        
        containerView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor
        )
        
        backButton.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            topConstant: 60,
            leftConstant: 30,
            widthConstant: 40,
            heightConstant: 40
        )
        
        containerTitle.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            topConstant: 90,
            leftConstant: 45,
            widthConstant: 200,
            heightConstant: 70
        )
        
        titleLabel.anchor(
            centerX: containerTitle.centerXAnchor,
            centerY: containerTitle.centerYAnchor
        )
        
        logoImage.anchor(
            left: titleLabel.rightAnchor,
            centerY: view.centerYAnchor,
            leftConstant: 5,
            widthConstant: 20,
            heightConstant: 20
        )
        
        containerTextFields.anchor(
            top: emailTextField.topAnchor,
            left: containerView.leftAnchor,
            bottom: passwordTextField.bottomAnchor,
            right: containerView.rightAnchor
        )
        
        emailTextField.anchor(
            left: view.leftAnchor,
            bottom: containerView.centerYAnchor,
            right: view.rightAnchor,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 70
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: emailTextField.leftAnchor,
            right: emailTextField.rightAnchor,
            topConstant: 10,
            heightConstant: 100
        )
        
        registerButton.anchor(
            left: passwordTextField.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: passwordTextField.rightAnchor,
            bottomConstant: 10,
            heightConstant: 45
        )
    }
}
