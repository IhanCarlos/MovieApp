//
//  LoginViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 31/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel
    
    private var imageIndex = 0
    private var imageTimer: Timer?
    private let imageArray: [UIImage] = [
        UIImage(named: "image1") ?? UIImage(),
        UIImage(named: "image2") ?? UIImage(),
        UIImage(named: "image3") ?? UIImage(),
        UIImage(named: "image4") ?? UIImage(),
        UIImage(named: "image5") ?? UIImage(),
        UIImage(named: "image6") ?? UIImage(),
        UIImage(named: "image7") ?? UIImage(),
        UIImage(named: "image8") ?? UIImage(),
        UIImage(named: "image9") ?? UIImage(),
        UIImage(named: "image11") ?? UIImage(),
        UIImage(named: "image12") ?? UIImage(),
    ]
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        return image
    }()
    
    lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.shadowColor = .white
        label.layer.shadowRadius = 0.2
        label.layer.shadowOpacity = 0.1
        return label
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
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Prosseguir", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton() {
        viewModel.goToHome()
    }
    
    @objc func tappedRegisterButton() {
        viewModel.goToRegister()
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    func configButtonEnable(_ enable: Bool) {
        if enable {
            loginButton.setTitleColor(.black, for: .normal)
            loginButton.isEnabled = true
        } else {
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
        }
    }
    
    func validText() {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        self.configButtonEnable(viewModel.validTextField(email: email, password: password) )
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
    
    override func viewDidLoad() {
        setupView()
        startImageAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        validText()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(logoImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(loginButton)
        containerView.addSubview(registerButton)
    }
    
    func setupConstraints() {
        imageView.pin(to: view)
        containerView.pin(to: view)
        
        logoImage.anchor(
            centerX: view.centerXAnchor,
            centerY: view.centerYAnchor,
            widthConstant: 100,
            heightConstant: 100
        )
        
        titleLabel.anchor(
            top: logoImage.bottomAnchor,
            centerX: view.centerXAnchor,
            topConstant: 10
        )
        
        emailTextField.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 20,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 45
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 5,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 45
        )
        
        loginButton.anchor(
            top: passwordTextField.bottomAnchor,
            left: passwordTextField.leftAnchor,
            right: passwordTextField.rightAnchor,
            topConstant: 15,
            heightConstant: 45
        )
        
        registerButton.anchor(
            top: loginButton.bottomAnchor,
            left: loginButton.leftAnchor,
            right: loginButton.rightAnchor,
            topConstant: 5,
            heightConstant: 45
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }
}
