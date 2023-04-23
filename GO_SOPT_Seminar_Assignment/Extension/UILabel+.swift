//
//  UILabel+.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/10.
//
import UIKit

extension UILabel {
    
    func asColor(targetString: String, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
    
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }
        
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = spacing
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        attributedText = attrString
    }
}
