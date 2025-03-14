//
//  SettingsItem.swift
//  diplom_1
//
//  Created by Сергей Недведский on 12.01.25.
//

final class SettingsItem: Codable{
    var value: Int
    var valueString: String
    
    init(value: Int, valueString: String) {
        self.value = value
        self.valueString = valueString
    }
}
