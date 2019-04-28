//
//  main.swift
//  Alamofire
//
//  Created by Mikhail Fogel on 25/04/2019.
//

import Foundation
import Alamofire

print("Input Github nickname:")
let response = readLine()

var readyString = String()

if response != "" {
readyString = "https://api.github.com/users/" + "\(response ?? "")" + "/repos"
} else {
    print("Blank string entered")
    // Если введена пустая строка, выходим из выполнения
    exit(0)
}

func getUserArray(from jsonArray: Any) -> [User]? {
    
    guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
    var users = [User]()
    print("Getting user repositories...")
    for jsonObject in jsonArray {
        if let user = User(json: jsonObject) {
            users.append(user)
        }
    }
    return users
}


func requestUser(handler:@escaping ([User], Error?)->Void) {
    print("Request to address: \(readyString)")
    request(readyString).responseJSON { responseJSON in
        switch responseJSON.result {
        case .success(let value):
            guard let users = getUserArray(from: value) else {
                print("Incorrect data entered")
        // также выходим из выполнения, если мы ввели неверное имя пользователя, которого на гитхабе нет
                exit(0)
            }
            handler(users, nil)
        case .failure(let error):
            print(error)
            handler([], error)
        }
    }
}

requestUser { (users: [User], error) in
    for item in users {
        print(item.name)
    }
    if let error = error {
        print(error.localizedDescription)
    }
    exit(0)
}
RunLoop.current.run()

