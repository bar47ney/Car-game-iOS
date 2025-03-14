//
//  Setting.swift
//  diplom_1
//
//  Created by Сергей Недведский on 8.01.25.
//

import Foundation

final class Settings: Codable{
    var nameUser: String
    var carImage: String
    var obstacle: [String]
    var hard: Double
    var userImage: String
    
    init(nameUser: String = Constansts.defaultUser, carImage: String = Constansts.firstCar, obstacle: [String] = Constansts.obstacleArray, hard: Double = Constansts.hardMedium, userImage: String = Constansts.defaultUserImage) {
        self.nameUser = nameUser
        self.carImage = carImage
        self.obstacle = obstacle
        self.hard = hard
        self.userImage = userImage
    }
    
    func setName(name: String){
        self.nameUser = name
    }
    
    func setCar(car: String){
        self.carImage = car
    }
    
    func setObstacle(obstacle: [String]){
        self.obstacle = obstacle
    }
    
    func setHard(hard: Double){
        self.hard = hard
    }
    
    func setImage(userImage: String){
        self.userImage = userImage
    }
}
