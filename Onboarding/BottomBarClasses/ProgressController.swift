//
//  ProgressController.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit

class ProgressController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var participants:[LeaderBoardItem]! = [LeaderBoardItem("123","123","123",12),LeaderBoardItem("123","123","123",12)]
    @IBOutlet weak var leaderBoard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderBoard.delegate = self
        leaderBoard.dataSource = self
        leaderBoard.register(LeaderBoardCellTableViewCell.nib(), forCellReuseIdentifier: LeaderBoardCellTableViewCell.identifier)
        leaderBoard.rowHeight = 40.0
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: LeaderBoardCellTableViewCell.identifier ,for: indexPath) as! LeaderBoardCellTableViewCell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 0.15
        cell.name = participants[indexPath.row].name
        cell.surname = participants[indexPath.row].surname
        cell.position = participants[indexPath.row].position
        cell.points = participants[indexPath.row].points
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
