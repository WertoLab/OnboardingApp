//
//  CourseCellTableViewCell.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class CourseCellTableViewCell: UITableViewCell{
    var title:String! = ""
    var duration:String! = ""
    static var identifier:String! = "coursecell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CourseCellTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
