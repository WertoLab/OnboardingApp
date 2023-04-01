//
//  TestsTableViewCell.swift
//  Onboarding
//
//  Created by Элина Борисова on 01.04.2023.
//

import UIKit

class TestsTableViewCell: UITableViewCell {

   static let identifier = "TestsTableViewCell"
    
    private let _button: UIButton = {
        let _button = UIButton()
        _button.tintColor = .green
        return _button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(_button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
