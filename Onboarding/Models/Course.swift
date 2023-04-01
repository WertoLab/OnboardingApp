//
//  Course.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class Course: Decodable {
    var duration:String!
    var ImageURL:String!
    var courseTitle:String!
    init(_ duration:String, _ ImageURL:String,_ courseTitle:String){
        self.duration = duration
        self.ImageURL = ImageURL
        self.courseTitle = courseTitle
    }
}
