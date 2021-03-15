//
//  SelectRoomViewController.swift
//  Swift6SNS1
//
//  Created by yasuki.satou on 2021/02/15.
//

import UIKit
import ViewAnimator


class SelectRoomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var roomArray = ["今日の1枚","爆笑報告場(草)","景色が好き！","夜景写真軍団","今日のごはん"]
    
    var imageArray = ["0","1","2","3","4"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        tableView.isHidden = true

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isHidden = false
        
        let animation = [AnimationType.vector(CGVector(dx: 0, dy: 30))]
        UIView.animate(views: tableView.visibleCells, animations: animation, completion:nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomArray.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //Roomの画像を反映
        let roomImageView = cell.contentView.viewWithTag(1) as! UIImageView

        roomImageView.image = UIImage(named: imageArray[indexPath.row])

        //room名
        let roomLabel = cell.contentView.viewWithTag(2) as! UILabel
        roomLabel.text = roomArray[indexPath.row]
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 228
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //画面遷移
        let timeLineVC = self.storyboard?.instantiateViewController(identifier: "timeLineVC") as! TimeLineViewController
        timeLineVC.roomNumber = indexPath.row
        self.navigationController?.pushViewController(timeLineVC, animated: true)

        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
