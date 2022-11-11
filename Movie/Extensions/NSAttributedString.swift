//
//  NSAttributedString.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import Foundation
import UIKit

extension NSAttributedString {
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attrString = NSMutableAttributedString(string: string)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attrString)
        //eturn attrString
    }
}
