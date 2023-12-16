//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 임수진 on 2023/12/09.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
