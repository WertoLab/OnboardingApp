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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        rootref = Database.database().reference()
        let ref = rootref.child("movies")
        ref.child("user_id").setValue(123456)
        ref.child("Courses").setValue([["title":"13","duration":"12","URL":"12"],["title":"13","duration":"12","URL":"12"]])
        // Do any additional setup after loading the view.
        
    }
    func observer(){
        self.rootref.child("ok")
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

