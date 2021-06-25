//
//  NextVC.swift
//  TableDefault
//
//  Created by sam on 2020/08/27.
//  Copyright © 2020 sam. All rights reserved.
//

import Foundation
import UIKit

class NextVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NextVC"

 
    }
    
    @IBAction func onPush(_ sender: UIButton) {
        print("jumpjump")
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "JumpVC") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
