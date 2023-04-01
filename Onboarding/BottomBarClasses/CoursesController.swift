//
//  CoursesController.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class CoursesController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var coursesTableView: UITableView!
    var courses:[Course] = [Course("12","12","12")]
    
    @IBOutlet weak var leaderBoard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.register(CourseCellTableViewCell.nib(), forCellReuseIdentifier: CourseCellTableViewCell.identifier)
        coursesTableView.rowHeight = 150.0
        //print("courses.countpppppppppoiudfghjkmnbvcxz")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CourseCellTableViewCell.identifier ,for: indexPath) as! CourseCellTableViewCell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 0.15
        cell.title = courses[indexPath.row].courseTitle
        cell.duration = courses[indexPath.row].duration
        print("ok")
        /*
        var image = UIImage(systemName: "star")
        cell.logo_of_doctor.image = image
        */
        //print(doctorsList.count)
        //cell.layer.cornerRadius = 15.0
        return cell
    }
}
