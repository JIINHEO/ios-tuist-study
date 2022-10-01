//
//  Comment.swift
//  APIKit
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import Foundation

public struct CommentModel: Decodable, Hashable{
    let status: String
    let message: String
    public let data: Comment
}

public struct Comment: Decodable, Hashable {
    public let commentList: [CommentList]
    let hasNext: Bool
}

public struct CommentList: Decodable, Hashable {
    public let createdAt: String
    let id: Int
    let content: String
    let bigScale: String
    public let nickname: String
    let emoji: String
}



//{
//  "status": "OK",
//  "message": "생성 성공",
//  "data": {
//    "commentList": [
//      {
//        "createdAt": "2022-09-25T11:11:42.465748",
//        "modifiedAt": "2022-09-25T11:11:42.465748",
//        "id": 663,
//        "content": " ㅠㅜㅜㅋㅋㅋㅋ 맘이 아픕니다 🥲",
//        "bigScale": "서울",
//        "nickname": "흐뭇한 종이유니콘",
//        "deleted": false,
//        "emoji": "🦄"
//      }
//    ],
//    "hasNext": true
//  }
//}
