//
//  SwiftyCodeItemView.swift
//
//  Created by arturdev on 6/28/18.
//

import UIKit

open class SwiftyCodeItemView: UIView {
    
    open var mode: Mode? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet open weak var textField: SwiftyCodeTextField!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.text = ""
        applyBorderedShadow()
        configureView()
        
        isUserInteractionEnabled = false
        
    }
    
    func configureView() {
        if mode == .square {
            layer.borderWidth = 1
        }
        layer.borderColor = mode?.borderColor
        if mode == .dashed {
            // textField.setBottomBorder()
            dashedBorder()
        }
    }
    
    private func applyBorderedShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 227/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 8
        layer.masksToBounds = false
        layer.cornerRadius = 4
    }
    
    private func dashedBorder() {
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
    
    override open func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    override open func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}

extension SwiftyCodeItemView {
    public enum Mode: Int {
        case square
        case dashed
        
        public var borderColor: CGColor {
            switch self {
            case .square: return UIColor.gray.cgColor
            case .dashed: return UIColor.clear.cgColor
            }
        }
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
