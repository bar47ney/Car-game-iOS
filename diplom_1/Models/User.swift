//
//  User.swift
//  diplom_1
//
//  Created by Сергей Недведский on 9.01.25.
//

final class User: Codable {
    let name: String
    let result: Int
    let userImage: String
    let userTime: String

    init(name: String = "John", result: Int = 0, userImage: String = Constansts.defaultUserImage, userTime: String = Constansts.noTime) {
        self.name = name
        self.result = result
        self.userImage = userImage
        self.userTime = userTime
    }
}
