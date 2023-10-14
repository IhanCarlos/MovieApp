//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 03/06/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var viewModel: RegisterViewModel
    
    lazy var registerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var backgroudImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "backgroundRegister")
        return img
    }()
    
    lazy var containerView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var containerTitle: UIStackView = {
        let stack = UIStackView()
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
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(systemName: "arrow.uturn.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black.withAlphaComponent(0.8)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email"
        tf.textColor = .darkGray
        tf.isUserInteractionEnabled = true
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no // Auto correcao do teclado
        tf.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua senha"
        tf.textColor = .darkGray
        tf.isUserInteractionEnabled = true
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        viewModel.goToLogin()
    }
    
    @objc func tappedRegisterButton() {
        viewModel.goToLogin()
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
    }
    
    func setupConstraints() {
        backgroudImage.pin(to: backgroudImage)
        containerView.pin(to: containerView)
        
        backButton.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            topConstant: 60,
            leftConstant: 30,
            widthConstant: 60,
            heightConstant: 60
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
            centerX: containerView.centerXAnchor,
            centerY: containerView.centerYAnchor
        )
        
        logoImage.anchor(
            left: titleLabel.rightAnchor,
            centerY: view.centerYAnchor,
            leftConstant: 5,
            widthConstant: 20,
            heightConstant: 20
        )
        
        emailTextField.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 400,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 45
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 45
        )
        
        registerButton.anchor(
            top: passwordTextField.bottomAnchor,
            left: passwordTextField.leftAnchor,
            right: passwordTextField.rightAnchor,
            topConstant: 15,
            heightConstant: 45
        )
        
        NSLayoutConstraint.activate([
            
//            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            backButton.heightAnchor.constraint(equalToConstant: 60),
//            backButton.widthAnchor.constraint(equalToConstant: 60),
            
//            containerTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
//            containerTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
//            containerTitle.heightAnchor.constraint(equalToConstant: 70),
//            containerTitle.widthAnchor.constraint(equalToConstant: 200),
            
//            titleLabel.centerYAnchor.constraint(equalTo: containerTitle.centerYAnchor),
//            titleLabel.centerXAnchor.constraint(equalTo: containerTitle.centerXAnchor),
            
//            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            logoImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
//            logoImage.heightAnchor.constraint(equalToConstant: 20),
//            logoImage.widthAnchor.constraint(equalToConstant: 20),
            
//            emailTextField.topAnchor.constraint(equalTo: view.topAnchor,constant: 400),
//            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
//            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}
