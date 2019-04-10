//
//  NewRequestViews.swift
//  Naql
//
//  Created by Youssef on 4/9/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class stackSpliter: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 2)
    }
}
class stackSpliterGray: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 1)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.835205555, green: 0.8353466392, blue: 0.8351857066, alpha: 1)
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
class NewRequestsLable: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        textColor = #colorLiteral(red: 0.4391664863, green: 0.4392447472, blue: 0.4391553998, alpha: 1)
        font = UIFont.CairoRegular(of: 15)
        textAlignment = .right
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect {
        return alignmentRect.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    override var alignmentRectInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
}

class PaymentLable: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 25)
    }
    init(text: String) {
        super.init(frame: .zero)
        textColor = #colorLiteral(red: 0.4391664863, green: 0.4392447472, blue: 0.4391553998, alpha: 1)
        font = .CairoRegular(of: 15)
        textAlignment = .right
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect {
        return alignmentRect.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    override var alignmentRectInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
}

class NewRequestsTextField: UITextField {
    init(placeHolder: String) {
        super.init(frame: .zero)
        placeholder = placeHolder
        font = .CairoSemiBold(of: 13)
        layer.borderWidth = 0.5
        viewBorderColor = .gray
        textAlignment = .right
        viewCornerRadius = 19
        translatesAutoresizingMaskIntoConstraints = false
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 40)
    }
}
