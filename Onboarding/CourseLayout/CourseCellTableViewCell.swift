//
//  CourseCellTableViewCell.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class CourseCellTableViewCell: UITableViewCell{
    @IBOutlet weak var EnterCourse: UIButton!
    @IBOutlet weak var durationText: UILabel!
    @IBOutlet weak var CourseImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    static var identifier:String! = "coursecell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 10
        titleText.contentMode = .right
        EnterCourse.addTarget(self, action: #selector(entercourseTap), for: .touchUpInside)
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CourseCellTableViewCell", bundle: nil)
    }
    @objc func entercourseTap(sender:UIButton!){
            print("ok")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
