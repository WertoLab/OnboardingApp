//
//  CourseCellTableViewCell.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit
import Firebase
class CourseCellTableViewCell: UITableViewCell{
    @IBOutlet weak var EnterCourse: UIButton!
    @IBOutlet weak var durationText: UILabel!
    @IBOutlet weak var CourseImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    var index:Int! = -1
    var index_w:Int! = -1
    var rootref: DatabaseReference!
    var money:Int! = 0;
    static var identifier:String! = "coursecell"
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        titleText.contentMode = .right
        EnterCourse.addTarget(self, action: #selector(entercourseTap), for: .touchUpInside)
        rootref = Database.database().reference()
        // Initialization code
    }
    
    
    static func nib() -> UINib{
        return UINib(nibName: "CourseCellTableViewCell", bundle: nil)
    }
    @objc func entercourseTap(sender:UIButton!){
        check_course_taken(self.index)
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func check_course_taken(_ course_index:Int!){
        self.rootref.child(ViewController.user_id).observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                var courses_amount:Int! = 0
                for snp in oShapshot{
                    var course = snp.value as? [String: String]
                    //(course!["isEntered"])
                    if(course!["isEntered"] == "yes" && courses_amount == course_index){
                        DispatchQueue.main.async {
                            self.EnterCourse.setTitle("Продолжить", for: .normal)
                        }
                    }else{
                        if(course!["isEntered"] == "no" && courses_amount == course_index){
                            DispatchQueue.main.async {
                                self.EnterCourse.setTitle("Продолжить", for: .normal)
                                self.rootref.child(ViewController.user_id).child(String(course_index)).updateChildValues([
                                    "isEntered":
                                        "yes"
                                ])
                                self.find_by_user_id(ViewController.user_id, 10)
                                /*
                                self.rootref.child(Users).child(String(course_index)).updateChildValues([
                                    "":
                                        "yes"
                                ])
                                 */
                            }
                        }
                    }
                    courses_amount+=1
                }
            }
        })
    }
     
    
    func find_by_user_id(_ id:String!,_ amount_of_money:Int!){
        self.rootref.child("Users").observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                var indxs:Int! = 0
                for snp in oShapshot{
                    var user = snp.value as? [String: Any]
                    //(course!["isEntered"])
                    //print(user)
                    //print(indxs)
                    //print(user!["name"])
                    if(user!["id"]! as! String == id){
                        print(indxs)
                        self.index_w = indxs
                        var mn:Int! = user!["points"] as!  Int
                        self.money = mn+10
                        //print("yes")
                    
                        
                    }
                    indxs+=1
                    
                    
                }
                self.rootref.child("Users").child(String(self.index_w)).updateChildValues([
                    "points":
                      200])
            }
        })
        
    }
    
    
}
