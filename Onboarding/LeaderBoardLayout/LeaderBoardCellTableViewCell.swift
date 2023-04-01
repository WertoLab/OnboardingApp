//
//  LeaderBoardCellTableViewCell.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class LeaderBoardCellTableViewCell: UITableViewCell {
     var name:String! = ""
     var surname:String! = ""
     var points:Int! = -1
     var position:String! = ""
     static var identifier:String! = "leaderboardcell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "LeaderBoardCellTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
