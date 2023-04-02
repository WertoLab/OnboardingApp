//
//  CoursesController.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit
import Firebase
import Kingfisher
class CoursesController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var course_index:Int! = 0
    var prev:Int! = 0
    @IBOutlet weak var coursesTableView: UITableView!
    var courses:[Course] = [Course("12","12","12",0,"yes")]
    //let dictcourses: [String: String] = ["name": "Avengers", "addedByUser": "John"]
    var rootref: DatabaseReference!
    @IBOutlet weak var leaderBoard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.register(CourseCellTableViewCell.nib(), forCellReuseIdentifier: CourseCellTableViewCell.identifier)
        coursesTableView.rowHeight = 190.0
        rootref = Database.database().reference()
        fetchCourses()
        let ref = Database.database().reference().child("Users").child("0")

        ref.updateChildValues([
            "name":
                "Andrew"
        ])
        
        //print("courses.countpppppppppoiudfghjkmnbvcxz")
        // Do any additional setup after loading the view.
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return courses.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CourseCellTableViewCell.identifier ,for: indexPath) as! CourseCellTableViewCell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 0.15
        cell.titleText.text = courses[indexPath.row].courseTitle
        cell.durationText.text = courses[indexPath.row].duration
        cell.CourseImage.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        cell.CourseImage.contentMode = .scaleAspectFill
        cell.CourseImage.layer.cornerRadius = 8.0
        cell.CourseImage.clipsToBounds = true
        String(self.course_index)
        check_course_taken(self.course_index,cell.EnterCourse)
        cell.index = prev
        prev = cell.index+1
        self.course_index+=1
        //print(self.course_index)
        /*
        var image = UIImage(systemName: "star")
        cell.logo_of_doctor.image = image
        */
        //print(doctorsList.count)
        print(courses[indexPath.row].ImageURL)
        //cell.layer.cornerRadius = 15.0
        cell.CourseImage.kf.setImage(with: URL(string: courses[indexPath.row].ImageURL), placeholder: nil, options: nil, progressBlock: nil, completionHandler: { result in
        switch result {
            case .success(let value):
                        print("Image: \(value.image). Got from: \(value.cacheType)")
                        //print("ok")
            case .failure(let error):
                        //print("ok")
                        print("Error: \(error)")
            }
        })
        return cell
    }
    
    func fetchCourses(){
        courses = []
        self.rootref.child("Courses").observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                var counter:Int! = 0
                self.courses = []
                for snp in oShapshot{
                    var course = snp.value as? [String: String]
                    counter+=1
                    self.courses.append(Course(course!["duration"]!,course!["URL"]!,course!["title"]!,counter!,course!["isEntered"]!))
                }
            }
            DispatchQueue.main.async {
                self.coursesTableView.reloadData()
            }
        })
    }
    
    func check_course_taken(_ course_index:Int!,_ button:UIButton!){
        self.rootref.child(ViewController.user_id).observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                var courses_amount:Int! = 0
                for snp in oShapshot{
                    var course = snp.value as? [String: String]
                    //(course!["isEntered"])
                    if(course!["isEntered"] == "yes" && courses_amount == course_index){
                        DispatchQueue.main.async {
                            button.setTitle("Продолжить", for: .normal)
                        }
                    }
                    courses_amount+=1
                }
            }
        })
    }
    
   
}
