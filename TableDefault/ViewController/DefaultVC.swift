//
//  DefaultVC.swift
//  TableDefault
//
//  Created by sam on 2020/08/27.
//  Copyright © 2020 sam. All rights reserved.
//

import Foundation
import UIKit
import Nuke
import Alamofire
import AlamofireImage

// MARK: - StoryboardLoadable

extension DefaultVC: StoryboardLoadable {
    static var ownerStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

class DefaultVC: UIViewController {
    
    let viewModel = MvvmViewModel()
       
    @IBOutlet var DefaultTable:UITableView!
    @IBOutlet var image:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "마이페이지"
     
        
           let imageURL = "https://app-fitmedi.s3.ap-northeast-2.amazonaws.com/development/profile/1600067025948.jpg"
        
       //let imageURL = "https://pbs.twimg.com/profile_images/927446347879292930/Fi0D7FGJ_400x400.jpg"

        var addBearer = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJXQlBkTlloaDdRWGFXQVA4eVV5bWxXejNDZkkyIiwiaWQiOjE5LCJpYXQiOjE2MDAwNDk3MTh9.XoXWYOCp4sziqkLtxacxlDq2uCJRKYweyNDMtoj2qfc"
        //헤더에 jwt토큰값 넣어줘야함
              let headerss: HTTPHeaders = [
                  .authorization(addBearer),
                  .accept("application/json")
              ]
        
        AF.request(imageURL, method: .get).responseImage { response in
        
        switch response.result {
        case let .success(value):
            self.image.image = value
            print("\(value)된겨?")
        case let .failure(error):
            print(error)
        }
        
        
           }
    }
    
    //메쏘드 뷰모델
    @IBAction func appleLogin(_ sender: UIButton){
        viewModel.cc(query: "롤로")
      
        //alert정상으로 작동함 이거쓰면됌
        //Transition Style:crossDissolve/Presentation:Over Current Context 꼭해주고
//        let notesAlert = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
//             self.present(notesAlert, animated: false, completion: nil)
//       }
        
        //위로 띄우는건 작동함 네비게이션컨트롤은 안넣었지만 동작은함
//         let notesAlert = UIStoryboard(name: "NextVC", bundle: nil).instantiateViewController(withIdentifier: "NextVC") as! NextVC
//                     self.present(notesAlert, animated: false, completion: nil)
//
        
        
        //루트 네비게이션 변경
//        let storyboard = UIStoryboard(name: "NextVC", bundle: Bundle.main)
//        let loginView: NextVC = storyboard.instantiateViewController(withIdentifier: "NextVC") as! NextVC
//        UIApplication.shared.keyWindow?.rootViewController = loginView
//        
        
    
        
//        let story = UIStoryboard(name: "NextVC", bundle:nil)
//          let vc = story.instantiateViewController(withIdentifier: "NextVC") as! NextVC
//          UIApplication.shared.windows.first?.rootViewController = vc
//          UIApplication.shared.windows.first?.makeKeyAndVisible()
        
       
    }
    
}

// MARK: - UITableViewDataSource

extension DefaultVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.peopleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemname = viewModel.peopleData[indexPath.row] as! ItemName
        let cell = tableView.dequeueReusableCell(withIdentifier: "MvvmTableViewCell") as! MvvmTableViewCell
        cell.captionLabel.text = itemname.caption
        cell.valueLabel.text = itemname.value
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension DefaultVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemname = viewModel.peopleData[indexPath.row] as! ItemName
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: itemname.action) {
            self.navigationController?.present(vc, animated: true)
        }
    }
}
