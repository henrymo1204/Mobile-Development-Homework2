//
//  FieldValueViewGenerator.swift
//  Homework2
//
//  Created by Henry mo on 11/21/20.
//  Copyright © 2020 Henry mo. All rights reserved.
//

import UIKit

class FieldValueViewGenerator {
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 30
        
        let lbl = UILabel()
        lbl.text = lblName
        stackView.addArrangedSubview(lbl)
        let val = UITextField()
        val.borderStyle = .none
        val.layer.masksToBounds = false
        val.layer.backgroundColor = UIColor.white.cgColor
        val.layer.shadowColor = UIColor.cyan.cgColor
        val.layer.shadowOffset = CGSize.init(width: 0.0, height: 1.0)
        val.layer.shadowOpacity = 1.0
        val.layer.shadowRadius = 0.0
        val.placeholder = "          "
        val.sizeToFit()
        stackView.addArrangedSubview(val)
        
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal
        )
        val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return stackView
    }
}
