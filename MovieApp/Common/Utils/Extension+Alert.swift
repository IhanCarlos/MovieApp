//
//  Extension+Alert.swift
//  MovieApp
//
//  Created by ihan carlos on 14/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    func customAlert(title: String, mensagem: String) {
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
