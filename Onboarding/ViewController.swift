//
//  ViewController.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var rootref: DatabaseReference!
    var all:[[String:String]]! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        rootref = Database.database().reference()
        
        rootref.child("user_id").setValue(123456)
        rootref.child("Courses").setValue([["title":"13","duration":"12","URL":"12"],["title":"13","duration":"12","URL":"12"]])
        rootref.child("Users").setValue([["name":"Andrew","surname":"Lemanov","position":"trainee","points":0,"id":ProgressController.randomString(len: 15)],["name":"Vasiliy","surname":"Pupkin","position":"trainee","points":10,"id":ProgressController.randomString(len: 15)]])
        // Do any additional setup after loading the view.
        observer()
        
    }
    
    func observer(){
        self.rootref.child("Courses").observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                for snp in oShapshot{
                    //var a = snp.value as? [String: String]
                    //self.all.append(a!)
                    //print(a!["title"])
                }
            }
        })
        
    }
     
    override func viewDidAppear(_ animated: Bool) {
        var bottomBar = UITabBarController();
        var progress = storyboard?.instantiateViewController(withIdentifier: "progressscreen") as! ProgressController;
        var courses = storyboard?.instantiateViewController(withIdentifier: "coursesscreen") as! CoursesController;
        var tests = storyboard?.instantiateViewController(withIdentifier: "testsscreen") as! TestsController;
        progress.title = "Progress";
        courses.title = "Courses"
        tests.title = "Tests"
        bottomBar.setViewControllers([progress,courses,tests], animated: true)
        bottomBar.modalPresentationStyle = .fullScreen
        present(bottomBar,animated: false,completion: nil)
    }


}

