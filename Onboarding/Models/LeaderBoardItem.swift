//
//  LeaderBoardItem.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class LeaderBoardItem: Decodable {
    var name:String!
    var surname:String!
    var position:String!
    var points:Int!
    init(_ name:String,_ surname:String,_ position:String,_ points:Int){
        self.position = position
        self.points = points
        self.surname = surname
        self.name = name
    }
}
