//
//  ButtonTableViewCell.swift
//  Onboarding
//
//  Created by Элина Борисова on 01.04.2023.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    
    @IBAction func didTapButton() {
        
    }
    
    
    func configure(with title: String) {
        button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.link, for: .normal)
    }

   

}
