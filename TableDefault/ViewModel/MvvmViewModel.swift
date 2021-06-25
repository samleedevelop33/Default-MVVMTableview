//
//  MvvmViewModel.swift
//  TableDefault
//
//  Created by sam on 2020/08/27.
//  Copyright © 2020 sam. All rights reserved.
// 뷰모델은 데이터

import Foundation


class MvvmViewModel: NSObject{
    let model: Model = Model()
    var peopleData: NSArray!
    
    override init(){
        let data1 = model.getPeopleData()["Setting"] as! NSArray
        let data2 = NSMutableArray()
        for i in 0..<data1.count{
            let tmpData = data1[i] as! NSDictionary
            let caption = tmpData["caption"] as! String
            let value = tmpData["value"] as! String
            let action = tmpData["action"] as! String
            data2.add(ItemName(caption: caption, value: value, action: action))
        }
        peopleData = NSArray(array:data2)//뷰에게 리턴
    }
    
    //메쏘드 뷰모델
    func cc(query: String){
        print(query+"클릭했다")
       
    }
}
