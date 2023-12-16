//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by 임수진 on 2023/12/17.
//

import Foundation

struct DeleteUserFeed : Decodable {
   let isSuccess: Bool?
   let code: Int?
   let message: String?
   let result: String?
}
