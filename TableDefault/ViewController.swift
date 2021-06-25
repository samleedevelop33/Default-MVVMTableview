//
//  ViewController.swift
//  TableDefault
//
//  Created by sam on 2020/08/27.
//  Copyright © 2020 sam. All rights reserved.
//

import UIKit

class MvvmTableViewCell:UITableViewCell{
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var etc: UILabel!
}

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
       
    let viewModel = MvvmViewModel()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       self.navigationItem.title = "zedd"
    }
    
    
    private func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.peopleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = viewModel.peopleData[indexPath.row] as! Person
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! MvvmTableViewCell
        cell.name.text = person.name
        cell.age.text = "\(person.age)"
        cell.etc.text = "\(person.height) / \(person.weight))"
        return cell
    }

}

