//
//  Util.swift
//  Maker
//
//  Created by mac on 2020/1/16.
//  Copyright © 2020 Souche. All rights reserved.
//

import Foundation

extension String {
    func base64Encoded() -> String {
        let plainData = data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: [])
        return base64String!
    }

    // Decode base64
    func base64Decoded() -> String {
        let decodedData = Data(base64Encoded: self, options: [])
        let decodedString = NSString(data: decodedData!, encoding: String.Encoding.utf8.rawValue)
        return decodedString! as String
    }
}
