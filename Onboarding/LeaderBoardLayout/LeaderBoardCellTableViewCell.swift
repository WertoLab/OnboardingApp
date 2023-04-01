//
//  LeaderBoardCellTableViewCell.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class LeaderBoardCellTableViewCell: UITableViewCell {
     
    @IBOutlet weak var name_surname: UILabel!
    @IBOutlet weak var positionText: UILabel!
    @IBOutlet weak var pointsText: UILabel!
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
