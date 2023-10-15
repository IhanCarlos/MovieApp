//
//  ComponentsButton.swift
//  UberHub
//
//  Created by ihan carlos on 15/06/23.
//

import UIKit

public enum Style {
    case containedQuadDark
    case containedGeneral
    case containedCustom(backgroundTint: UIColor)
    case borderButton
}

class CustomButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    init(frame: CGRect, style: Style) {
        super.init(frame: frame)
        setupButton(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupButton(style: Style) {
        translatesAutoresizingMaskIntoConstraints = false
    
        switch style {

        case .containedQuadDark:
            titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            backgroundColor = .ds(.purpleDark)
            setTitleColor(UIColor.ds(.beige), for: .normal)
            clipsToBounds = true
            layer.cornerRadius = 18
            
        case.containedGeneral:
            titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            setTitleColor(UIColor.ds(.beige), for: .normal)
            backgroundColor = .ds(.redLight).withAlphaComponent(0.5)
            clipsToBounds = true
            layer.cornerRadius = 22
            
        case let .containedCustom(backgroundTint):
            backgroundColor = backgroundTint
            titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            setTitleColor(UIColor.black, for: .normal)
            
        case.borderButton:
            layer.borderWidth = 2
            layer.borderColor = UIColor.ds(.yellow).cgColor
            clipsToBounds = true
            layer.cornerRadius = 18
            titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            setTitleColor(UIColor.ds(.yellow), for: .normal)
            backgroundColor = .clear
        }
    }
    
    private func updateButtonAppearance() {
        if isEnabled {
            alpha = 1.0
        } else {
            alpha = 0.5
        }
    }
}
