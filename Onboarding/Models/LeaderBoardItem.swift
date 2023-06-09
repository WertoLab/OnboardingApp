//
//  LeaderBoardItem.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class LeaderBoardItem: Decodable {
    var id:String!
    var name:String!
    var surname:String!
    var position:String!
    var points:Int!
    init(_ name:String,_ surname:String,_ position:String,_ points:Int,_ id:String){
        self.position = position
        self.points = points
        self.surname = surname
        self.name = name
        self.id = id
    }
}
