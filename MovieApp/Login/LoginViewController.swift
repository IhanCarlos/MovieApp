//
//  LoginViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 31/05/23.
//

import UIKit

class LoginViewController: UIViewController, CustomTextFieldLineDelegate {
    
    var viewModel: LoginViewModel
    
    private var imageIndex = 0
    private var imageTimer: Timer?
    private let imageArray: [UIImage?] = [
        UIImage(named: "image1"),
        UIImage(named: "image2"),
        UIImage(named: "image3"),
        UIImage(named: "image4"),
        UIImage(named: "image5"),
        UIImage(named: "image6"),
        UIImage(named: "image7"),
        UIImage(named: "image8"),
        UIImage(named: "image9"),
        UIImage(named: "image11"),
        UIImage(named: "image12")
    ]
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        return image
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    lazy var logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "film")
        img.tintColor = .white
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Movie "
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var containerTextFields: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .white.withAlphaComponent(0.7)
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
    
    lazy var loginButton: CustomButton = {
        let button = CustomButton(frame: .zero, style: .containedGeneral)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Prosseguir", for: .normal)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton() {
        viewModel.goToHome()
    }
    
    lazy var registerButton: CustomButton = {
        let button = CustomButton(frame: .zero, style: .containedGeneral)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar-se", for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        viewModel.goToRegister()
    }
    
    override func viewDidLoad() {
        setupView()
        startImageAnimation()
        configButtonEnable(enable: false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    init(viewModel: LoginViewModel) {
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
          loginButton.isEnabled = enable
          if enable {
              loginButton.setTitleColor(.white, for: .normal)
              loginButton.backgroundColor = .blue
          } else {
              loginButton.setTitleColor(.gray, for: .normal)
              loginButton.backgroundColor = .lightGray
          }
      }
    
    private func startImageAnimation() {
        imageTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    @objc private func changeImage() {
        UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.imageView.image = self.imageArray[self.imageIndex]
        }, completion: nil)
        
        imageIndex += 1
        if imageIndex >= imageArray.count {
            imageIndex = 0
        }
    }
    
    deinit {
        imageTimer?.invalidate()
    }
}

extension LoginViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(logoImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(containerTextFields)
        containerTextFields.addSubview(emailTextField)
        containerTextFields.addSubview(passwordTextField)
        containerView.addSubview(loginButton)
        containerView.addSubview(registerButton)
    }
    
    func setupConstraints() {
        imageView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        
        containerView.anchor(
            top: view.centerYAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 30,
            leftConstant: 40,
            rightConstant: 40
        )
        
        logoImage.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            centerX: view.centerXAnchor,
            widthConstant: 100,
            heightConstant: 100
        )
        
        titleLabel.anchor(
            top: logoImage.bottomAnchor,
            centerX: view.centerXAnchor,
            topConstant: 10
        )
        
        containerTextFields.anchor(
            top: containerView.topAnchor,
            left: containerView.leftAnchor,
            bottom: passwordTextField.bottomAnchor,
            right: containerView.rightAnchor,
            topConstant: 15,
            leftConstant: 15,
            rightConstant: 15
        )
        
        emailTextField.anchor(
            top: containerTextFields.topAnchor,
            left: containerTextFields.leftAnchor,
            right: containerTextFields.rightAnchor,
            topConstant: 10,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 70
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: emailTextField.leftAnchor,
            right: emailTextField.rightAnchor,
            topConstant: 10,
            heightConstant: 120
        )
        
        loginButton.anchor(
            left: passwordTextField.leftAnchor,
            bottom: registerButton.topAnchor,
            right: passwordTextField.rightAnchor,
            bottomConstant: 10,
            heightConstant: 50
        )
        
        registerButton.anchor(
            left: loginButton.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: loginButton.rightAnchor,
            bottomConstant: 10,
            heightConstant: 50
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }
}
