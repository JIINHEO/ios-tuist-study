//
//  Symbol.swift
//  APIKit
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import Foundation

public struct Symbol: Decodable {
    var NEARUSDT: Data
}

struct sf: Decodable {
    var symbol: String
    var index: String
    var edp: String
    var formula: String
}

//{
//    "code": 200,
//    "data": {
//        "NEARUSDT": {
//            "symbol": "NEARUSDT",
//            "index": "3.5838833333333333",
//            "edp": "3.58509458",
//            "formula": "(3.582[BINANCE]+3.586[FTX]+3.5872[BYBIT]+3.585[OKX]+3.5814[BITGET]+3.5817[HUOBI])/6",
//            "time": 1664519819000
//        }
//    }
//}
