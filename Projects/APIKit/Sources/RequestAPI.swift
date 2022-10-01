//
//  RequestAPI.swift
//  APIKit
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import Foundation

public enum Result<Success, Failure: Error > {
    case success(Success)
    case failure(Failure)
}

//https://app.wisebitcoin.finance/api/quote/v1/obj/indices/?symbol=NEARUSDT

public class RequestAPI: ObservableObject {
    
    public init() { }
    public static let shared = RequestAPI()
    @Published public var comment = [CommentModel]()
    
    //    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    public func fetchData(){
        
        //        guard let apiKey = apiKey else { return }
        //
        //        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=\(apiKey)") else{
        //            return
        //        }
        
        guard let url = URL(string: "http://3.35.55.100/api/comment?size=10") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                // 실패
                return
            }
            
            guard let data = data else{
                return
            }
            
            do{
                let apiResponse = try JSONDecoder().decode(CommentModel.self, from: data)
//                self.comment = [apiResponse]
                DispatchQueue.main.async {
                    self.comment = [apiResponse]
                }
                // 성공
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("============DecodingError.keyNotFound(key, context)====================")
                print("Key '\(key)' not found:", context.debugDescription)
                print("\ncodingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("============DecodingError.valueNotFound(value, context) ====================")
                print("Value '\(value)' not found:", context.debugDescription)
                print("\ncodingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("============DecodingError.typeMismatch(type, context)====================")
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("\ncodingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        task.resume()
    }
}

//
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
//      },
