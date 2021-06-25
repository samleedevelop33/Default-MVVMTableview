//
//  Model.swift
//  TableDefault
//
//  Created by sam on 2020/08/27.
//  Copyright © 2020 sam. All rights reserved.
//

import Foundation

//클래스정의
class ItemName:NSObject{
    
    //초기화,생성
    var caption: String = ""
    var value: String = ""
    var action: String = ""
  
    init(caption:String, value: String, action:String){
        self.caption = caption
        self.value = value
        self.action = action
    }
}

////데이터를 반환할 모델
class Model:NSObject{
    func getPeopleData() -> NSDictionary{
        return [
            "Setting":[
                ["caption":"닉네임","value":"닉네임이다","action":"NextVC"],      ["caption":"이메일","value":"이멩리","action":"이멜엑션"],      ["caption":"전화번호","value":"전번","action":"전번액션"],      ["caption":"회원구분","value":"마스터","action":"회원구분액션"]
            ],
        ]
    }
}


