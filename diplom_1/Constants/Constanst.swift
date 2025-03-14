//
//  Constanst.swift
//  diplom_1
//
//  Created by Сергей Недведский on 29.12.24.
//

import UIKit

final class Constansts {
    static let borderWidth = 0.2
    static let borderColor: UIColor = .systemGreen

    static let roadColor: UIColor = .gray
    
    static let lineColor: UIColor = .white
    static let lineHeightSize: CGFloat = 3
    static let lineTimeGeneration: TimeInterval = 0.3
    static let lineTimeSpeed: Double = 1
    
    static let carTimeGenerationStart: Double = 0.5
    static let carTimeGenerationEnd: Double = 4.0
    static let carTimeSpeedStart: Double = 0.8
    static let carTimeSpeedEnd: Double = lineTimeSpeed
    
    static let carAngle: CGFloat = 180 * .pi / 180
    
    
    static let carTimeGenerationStartRight: Double = 2
    static let carTimeGenerationEndRight: Double = 9
    
    static let carTimeSpeedStartRight: Double = lineTimeSpeed
    static let carTimeSpeedEndRight: Double = 1.5

    static let carImageArray = ["mainCar1.png","aCar1.png","aCar7.png"]
    
    static let anotherCarImageArray = ["aCar2.png","aCar1.png","aCar3.png","aCar4.png","aCar5.png","aCar6.png","aCar7.png"]
    static let obstacleArraySecond = ["obstacle1.svg","obstacle3.svg","obstacle4.svg","obstacle5.svg"]
    static let obstacleArrayThird = ["obstacle2.svg"]
    
    static let carWidth: CGFloat = 12
    static let carHeight: CGFloat = 12
    
    static let carImageSize: CGFloat = 0.5

    static let carSpeed: TimeInterval = 0.3
    static let carBoxShadowRadius: CGFloat = 15
    static let carBoxShadowOpacity: Float = 0.5
    static let carBoxShadowColor: UIColor? = UIColor(hex: "#202020")

    static let arrowWidth = 0.7
    static let arrowHeight = 0.3
    static let arrowBottom: CGFloat = 0.9
    static let arrowLeftString: String = "←"
    static let arrowRightString: String = "→"
    
    static let arrowHeightK = 1.4
    
    static let angle: CGFloat = 45 * .pi / 180
    static let failAngle: CGFloat = 245 * .pi / 180
    
    static let btnColor: UIColor = .white
    static let btnTextColor: UIColor = .darkText
    
    static let scoreColor: UIColor = .white
    static let scoreBackgroundColor: UIColor = .clear
    static let scoreHeight: CGFloat = 0.1
    static let scoreWidth: CGFloat = 0.4
    static let scoreHeightFull: CGFloat = 0.2
    static let scoreWidthFull: CGFloat = 0.6
    static let scoreY: CGFloat = 0.08
    static let scoreZeroString: String = "0"
    
    static let obstacleTimeGenerateStart: TimeInterval = 0.3
    static let obstacleTimeGenerateEnd: TimeInterval = 1
    static let obstacleArray = ["obstacle1.svg", "obstacle2.svg","obstacle3.svg","obstacle4.svg","obstacle5.svg"]
    
    static let startCount = 3
    
    static let playString = "Play"
    static let settingString = "Settings"
    static let tableOfRecordsString = "Records"
    
    static let menuColor: UIColor = .white
    static let menuBackgroundColor: UIColor = .blue
    static let menuViewBackgroundColor: UIColor = .white
    static let menuAlign: NSTextAlignment = .center
    
    static let step: CGFloat = 16
    static let stepTop: CGFloat = 200
    
    static let backSize: CGFloat = 40
    static let backTop: CGFloat = 80
    static let backLeft: CGFloat = 16
    static let backImage: String = "back.svg"
    
    static let hard: [Double] = [1.2, 1, 0.8]
    static let hardEasy: Double = 1.5
    static let hardMedium: Double = 1.2
    static let hardHard: Double = 0.8
    
    static let hardEasyString: String = "Easy"
    static let hardMediumString: String = "Medium"
    static let hardHardString: String = "Hard"
    
    static let settingColor: UIColor = .white
    static let settingBackgroundColor: UIColor = .blue
    static let settingBackgroundColorActive: UIColor = .white
    static let settingViewBackgroundColor: UIColor = .white
    static let settingAlign: NSTextAlignment = .center
    static let settingStep: CGFloat = 8
    static let settingStepTop: CGFloat = 100
    
    static let settingCarString = "Car"
    static let settingObstacleString = "Obstacle"
    static let settingSpeedString = "Speed"
    static let settingName = "Name"
    
    static let firstCar = "mainCar1.png"
    static let secondCar = "aCar1.png"
    static let thirdCar = "aCar7.png"
    
    static let firstCarString: String = "Yellow"
    static let secondCarString: String = "Police"
    static let thirdCarString: String = "Orange"
    
    static let firstObstacle = "aCar2.png"
    static let secondObstacle = "obstacle1.svg"
    static let thirdObstacle = "obstacle2.svg"
    
    static let firstObstacleString: String = "Cars"
    static let secondObstacleString: String = "Cactus"
    static let thirdObstacleString: String = "Animals"
    
    static let firstSpeed = "speed1.svg"
    static let secondSpeed = "speed2.svg"
    static let thirdSpeed = "speed3.svg"
    
    static let defaultUserImage = "aCar7.png"
    
    static let defaultUser = "John"
    
    static let pickerCancel = "Cancel"
    static let pickerCamera = "Camera"
    static let pickerGallery = "Gallery"
    static let pickerError = "Source not available"
    static let pickerTitle = "Chose camera"
    
    static let noTime = "No time"
    static let timeFormat = "dd.MM.yy HH:mm"
    
    static let userImageWidth: CGFloat = 150
    
    static let userRecordsImageHeight: CGFloat = 30
    
    static let emptyListString: String = "Нет рекордов"
    
    static let widthHeightImage: CGFloat = 30
}
