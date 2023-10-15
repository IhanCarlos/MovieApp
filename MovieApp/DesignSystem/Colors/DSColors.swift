//
//  ds(Colors).swift
//  MovieApp
//
//  Created by ihan carlos on 12/06/23.
//

import UIKit

public enum Colors: String {
    case purpleDark = "#1D1A39"
    case purple = "#451952"
    case redDark = "#662549"
    case redLight = "AE445A"
    case yellow = "#F39F5A"
    case beige = "#E8BCB9"
    case pink = "#E331EF"
    case cyan = "#44F9F2"
    case orange = "#F7A053"
    case orangeDark = "#F17D34"
}

public extension UIColor {
    static func ds( _ color: Colors) -> UIColor {
        return UIColor(hexString: color.rawValue)
    }
}
