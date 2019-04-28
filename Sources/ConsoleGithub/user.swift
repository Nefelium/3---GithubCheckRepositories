//
//  user.swift
//  Alamofire
//
//  Created by Mikhail Fogel on 25/04/2019.
//

import Foundation

class User: NSObject {
    
    var name: String
    
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String
            else {
                return nil
        }
        self.name = name
    }
}
