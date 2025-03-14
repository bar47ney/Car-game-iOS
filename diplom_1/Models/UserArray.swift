//
//  UserArray.swift
//  diplom_1
//
//  Created by Сергей Недведский on 9.01.25.
//

final class UserArray: Codable {
    var results: [User]
    
    init(results: [User] = []) {
        self.results = results
    }
}
