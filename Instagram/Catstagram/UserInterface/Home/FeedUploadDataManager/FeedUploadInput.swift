//
//  FeedUploadInput.swift
//  Catstagram
//
//  Created by 임수진 on 2023/12/09.
//

struct FeedUploadInput : Encodable {
    var content : String?
    var postImgUrl : [String]? // List 형태로 String을 받음
}
