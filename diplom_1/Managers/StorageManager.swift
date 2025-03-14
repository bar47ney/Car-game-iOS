//
//  StorageManager.swift
//  diplom_1
//
//  Created by Сергей Недведский on 8.01.25.
//

import Foundation
import UIKit

private extension String {
    static let settings = "setting"
    static let records = "records"
    static let images = "images"
}

final class StorageManagaer {

    static let shared = StorageManagaer()

    private init() {

    }
    
    //MARK: -  User Save
    
    func saveUser(userArray: UserArray) {
        UserDefaults.standard.set(encodable: userArray, forKey: .records)
    }
    
    func loadUsers() -> (status: Bool, data: UserArray) {
//        UserDefaults.standard.removeObject(forKey: .records)
        if let users = UserDefaults.standard.value(UserArray.self, forKey: .records){
            return (true, users)
        }
        return (false, UserArray())
    }
    
    //MARK: -  Settings Save

    func saveSetting(setting: Settings) {
        UserDefaults.standard.set(encodable: setting, forKey: .settings)
    }

    func loadSettings() -> (status: Bool, data: Settings) {
        if let setting = UserDefaults.standard.value(Settings.self, forKey: .settings){
            return (true, setting)
        }
        return (false, Settings())
    }
    
    //MARK: -  Image Save
    
    func saveImage(image: Image){
        var images = loadImages()
        images.append(image)
        
        UserDefaults.standard.set(encodable: images, forKey: .images)
    }
    
    func loadImages() -> [Image]{
        let images = UserDefaults.standard.value([Image].self, forKey: .images)
        return images ?? []
    }

    func savelmage(_ image: UIImage) -> String? {
        guard
            let documentsDirectory = FileManager.default.urls(
                for: .documentDirectory, in: .userDomainMask
            ).first,
            let data = image.jpegData(compressionQuality: 1)
        else {
            return nil
        }
        let fileName = UUID().uuidString
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch let error {
                print(error.localizedDescription)
                //try? FileManager.default.removeItem(atPath: fileURL.path)
            }
        }

        do {
            try data.write(to: fileURL)
            return fileName
        } catch let error {
            print(error.localizedDescription)
            return nil
        }

    }

    func loadImage(filename: String) -> UIImage? {
        guard
            let documentsDirectory = FileManager.default.urls(
                for: .documentDirectory, in: .userDomainMask
            ).first
        else {
            return nil
        }
        let fileUrl = documentsDirectory.appendingPathComponent(filename)
        return UIImage(contentsOfFile: fileUrl.path)
    }
}

extension UserDefaults {
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }

    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
            let value = try? JSONDecoder().decode(type, from: data)
        {
            return value
        }
        return nil
    }
}
