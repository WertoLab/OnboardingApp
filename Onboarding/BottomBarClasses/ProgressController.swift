//
//  ProgressController.swift
//  Onboarding
//
//  Created by Andrey on 01.04.2023.
//

import UIKit
import Firebase
class ProgressController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var rootref: DatabaseReference!
    var participants:[LeaderBoardItem]! = [LeaderBoardItem("123","123","123",12,"0")]
    @IBOutlet weak var leaderBoard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderBoard.delegate = self
        leaderBoard.dataSource = self
        leaderBoard.register(LeaderBoardCellTableViewCell.nib(), forCellReuseIdentifier: LeaderBoardCellTableViewCell.identifier)
        leaderBoard.rowHeight = 40.0
        rootref = Database.database().reference()
        fetchUsers()
       
    }
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: LeaderBoardCellTableViewCell.identifier ,for: indexPath) as! LeaderBoardCellTableViewCell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 0.15
        cell.name_surname.text = participants[indexPath.row].name+" "+participants[indexPath.row].surname
        cell.positionText.text = participants[indexPath.row].position
        cell.pointsText.text = String(participants[indexPath.row].points)
        
        return cell
    }
    
    func fetchUsers(){
        participants = []
        self.rootref.child("Users").observe(.value, with: {(shapshot) in
            if let oShapshot = shapshot.children.allObjects as? [DataSnapshot]{
                self.participants = []
                for snp in oShapshot{
                    var user = snp.value as? [String: Any]
                    //["name":"Andrew","surname":"Lemanov","position":"trainee","points":0]
                    
                    print(user!["position"]!)
                    
                    self.participants.append(LeaderBoardItem(user!["name"]! as! String,user!["surname"]! as! String,user!["position"]! as! String,user!["points"]! as! Int,user!["id"]! as! String))
                }
                
                self.participants = self.participants.sorted(by: { $0.points > $1.points })
                
                DispatchQueue.main.async {
                    self.leaderBoard.reloadData()
                }
            }
        })
        
    }
    static func randomString(len:Int) -> String {
         let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
         var c = Array(charSet)
         var s:String = ""
         for n in (1...10) {
             s.append(c[Int(arc4random()) % c.count])
         }
         return s
     }

}
