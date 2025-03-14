//
//  ViewController.swift
//  diplom_1
//
//  Created by Сергей Недведский on 28.12.24.
//

import UIKit

final class ViewController: UIViewController {
    private var score = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }

    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.scoreZeroString
        label.textColor = Constansts.scoreColor
        label.backgroundColor = Constansts.scoreBackgroundColor
        label.numberOfLines = 3
        label.textAlignment = .center
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()

    private let scoreLabelFull: UILabel = {
        let label = UILabel()
        label.text = Constansts.scoreZeroString
        label.textColor = Constansts.scoreColor
        label.backgroundColor = Constansts.scoreBackgroundColor
        label.numberOfLines = 3
        label.textAlignment = .center
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()

    private let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(Constansts.btnTextColor, for: .normal)
        button.setTitle(Constansts.arrowLeftString, for: .normal)
        button.backgroundColor = Constansts.btnColor
        button.isUserInteractionEnabled = true
        button.roundCorners()
        return button
    }()

    private let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(Constansts.btnTextColor, for: .normal)
        button.setTitle(Constansts.arrowRightString, for: .normal)
        button.backgroundColor = Constansts.btnColor
        button.isUserInteractionEnabled = true
        button.roundCorners()
        return button
    }()

    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(Constansts.btnTextColor, for: .normal)
        button.setTitle(Constansts.playString, for: .normal)
        button.backgroundColor = Constansts.btnColor
        button.isUserInteractionEnabled = true
        button.roundCorners()
        return button
    }()

    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.roadColor
        return view
    }()

    private let borderLeft: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.borderColor
        return view
    }()

    private let borderRight: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.borderColor
        return view
    }()

    private let carView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()

    private let blurView = UIView()
    private let blurViewSecond = UIView()

    private var carWidth: CGFloat = 0
    private var mainCarWidth: CGFloat = 0
    private var borderWidth: CGFloat = 0
    private var lineWidth: CGFloat = 0
    private var lineHeight: CGFloat = 0
    private var arrowWidth: CGFloat = 0

    private var objectsArray: [UIView] = []
    private var scoreArray: [Int] = []

    private var endGame = false

    private let currentSetting = StorageManagaer.shared.loadSettings()
    private let currentUserArray = StorageManagaer.shared.loadUsers()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        mainLogic()
    }

    private func configureUI() {
        borderWidth = view.frame.width * Constansts.borderWidth
        carWidth = view.frame.width * (1 - Constansts.borderWidth * 2) / 2
        lineWidth = carWidth / 4
        lineHeight = lineWidth * Constansts.lineHeightSize
        arrowWidth = carWidth * Constansts.arrowWidth

        mainCarWidth = carWidth * Constansts.carImageSize

        mainView.frame = CGRect(
            x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(mainView)

        borderRight.frame = CGRect(
            x: 0, y: 0, width: borderWidth, height: view.frame.height)
        borderLeft.frame = CGRect(
            x: view.frame.width - borderWidth, y: 0, width: borderWidth,
            height: view.frame.height)
        mainView.addSubview(borderLeft)
        mainView.addSubview(borderRight)

        objectsArray.append(borderLeft)
        objectsArray.append(borderRight)

        carView.image = UIImage(named: currentSetting.data.carImage)
        if let height = carView.image?.size.height {
            if let width = carView.image?.size.width {
                carView.frame = CGRect(
                    x: view.center.x + self.mainCarWidth / 2,
                    y: view.frame.height * (1 - Constansts.arrowHeight),
                    width: mainCarWidth,
                    height: mainCarWidth * height / width)
            }
        }
        carView.dropShadow(
            color: Constansts.carBoxShadowColor,
            opacity: Constansts.carBoxShadowOpacity,
            radius: Constansts.carBoxShadowRadius)
        mainView.addSubview(carView)

        leftButton.frame = CGRect(
            x: borderWidth + arrowWidth / 4,
            y: view.frame.height * Constansts.arrowBottom, width: arrowWidth,
            height: arrowWidth / Constansts.arrowHeightK)
        rightButton.frame = CGRect(
            x: view.center.x + arrowWidth / 4,
            y: view.frame.height * Constansts.arrowBottom, width: arrowWidth,
            height: arrowWidth / Constansts.arrowHeightK)
        playButton.frame = CGRect(
            x: view.center.x + arrowWidth / 4,
            y: view.frame.height * Constansts.arrowBottom, width: arrowWidth,
            height: arrowWidth / 2)
        playButton.center.x = view.center.x
        mainView.addSubview(leftButton)
        mainView.addSubview(rightButton)
        mainView.addSubview(playButton)
        playButton.layer.opacity = 0

        mainView.bringSubviewToFront(leftButton)
        mainView.bringSubviewToFront(rightButton)

        scoreLabel.frame = CGRect(
            x: view.center.x, y: view.frame.height * Constansts.scoreY,
            width: view.frame.width * Constansts.scoreWidth,
            height: view.frame.height * Constansts.scoreHeight)

        scoreLabelFull.frame = CGRect(
            x: view.center.x, y: view.frame.height * Constansts.scoreY,
            width: view.frame.width * Constansts.scoreWidthFull,
            height: view.frame.height * Constansts.scoreHeightFull)

        blurView.frame = scoreLabel.frame
        blurView.layer.masksToBounds = true
        blurView.roundCorners()
        blurView.center.x = view.center.x
        mainView.addSubview(blurView)

        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.addSubview(blurEffectView)

        scoreLabel.frame = blurView.bounds
        blurView.addSubview(scoreLabel)

        blurViewSecond.frame = scoreLabelFull.frame
        blurViewSecond.layer.masksToBounds = true
        blurViewSecond.roundCorners()
        blurViewSecond.center.x = view.center.x
        mainView.addSubview(blurViewSecond)

        let blurEffectSecond = UIBlurEffect(style: .light)
        let blurEffectViewSecond = UIVisualEffectView(effect: blurEffectSecond)
        blurEffectViewSecond.frame = blurViewSecond.bounds
        blurEffectViewSecond.autoresizingMask = [
            .flexibleWidth, .flexibleHeight,
        ]
        blurViewSecond.addSubview(blurEffectViewSecond)

        scoreLabelFull.frame = blurViewSecond.bounds
        blurViewSecond.addSubview(scoreLabelFull)
        blurViewSecond.layer.opacity = 0

        backView.image = UIImage(named: Constansts.backImage)
        backView.frame = CGRect(
            x: Constansts.backLeft, y: Constansts.backTop,
            width: Constansts.backSize,
            height: Constansts.backSize)
        mainView.addSubview(backView)
        mainView.bringSubviewToFront(backView)

        let tapActionLeft = UITapGestureRecognizer(
            target: self, action: #selector(tapActionLeft))
        leftButton.addGestureRecognizer(tapActionLeft)

        let tapActionRight = UITapGestureRecognizer(
            target: self, action: #selector(tapActionRight))
        rightButton.addGestureRecognizer(tapActionRight)

        let play = UITapGestureRecognizer(
            target: self, action: #selector(play))
        playButton.addGestureRecognizer(play)

        let back = UITapGestureRecognizer(
            target: self, action: #selector(back))
        backView.addGestureRecognizer(back)
    }

    private func mainLogic() {
        self.blurViewSecond.layer.opacity = 0
        self.blurView.layer.opacity = 1

        score = 0
        playButton.layer.opacity = 0
        playButton.isEnabled = false

        leftButton.isEnabled = true
        rightButton.isEnabled = true

        leftButton.layer.opacity = 1
        rightButton.layer.opacity = 1

        endGame = false

        let lineTimer = Timer.scheduledTimer(
            withTimeInterval: Constansts.lineTimeGeneration, repeats: true
        ) {
            timer in
            if self.endGame {
                timer.invalidate()
            }
            let line = UIView()
            line.backgroundColor = Constansts.lineColor
            line.frame = CGRect(
                x: self.view.center.x, y: -self.lineHeight,
                width: self.lineWidth, height: self.lineHeight)
            line.center.x = self.view.center.x
            self.mainView.addSubview(line)
            self.mainView.sendSubviewToBack(line)
            UIView.animate(
                withDuration: Constansts.lineTimeSpeed
                    * self.currentSetting.data.hard, delay: 0,
                options: [.curveLinear]
            ) {
                line.frame.origin.y = self.view.frame.height
            } completion: { _ in
                line.removeFromSuperview()
            }
        }

        let obstacleTimer = Timer.scheduledTimer(
            withTimeInterval: TimeInterval.random(
                in: Constansts
                    .obstacleTimeGenerateStart...Constansts
                    .obstacleTimeGenerateEnd), repeats: true
        ) {
            timer in
            if self.endGame {
                timer.invalidate()
            }
            let obstacleUIImageView = UIImageView()
            obstacleUIImageView.image = UIImage(
                named: Constansts.obstacleArray[
                    Int.random(in: 0..<Constansts.obstacleArray.count)])
            switch Int.random(in: 0...1) {
            case 0:
                obstacleUIImageView.frame = CGRect(
                    x: 0, y: -self.borderWidth, width: self.borderWidth,
                    height: self.borderWidth)
            case 1:
                obstacleUIImageView.frame = CGRect(
                    x: self.view.frame.width - self.borderWidth,
                    y: -self.borderWidth, width: self.borderWidth,
                    height: self.borderWidth)
            default:
                print("ok")
            }

            obstacleUIImageView.contentMode = .scaleAspectFit
            self.mainView.addSubview(obstacleUIImageView)
            UIView.animate(
                withDuration: Constansts.lineTimeSpeed
                    * self.currentSetting.data.hard, delay: 0,
                options: [.curveLinear]
            ) {
                obstacleUIImageView.frame.origin.y = self.view.frame.height
            } completion: { _ in
                obstacleUIImageView.removeFromSuperview()
            }
        }

        generateLeftCar()

        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            timer in
            print("cartimer")
            print(self.scoreArray.count)
            if !self.endGame {
                self.checkIntersection(checkjObject: self.carView)
            }
            if self.endGame {
                timer.invalidate()
            }
        }

    }

    private func generateLeftCar() {

        //MARK: - left car on right line generate
        var rightPositionCGRect = self.borderWidth

        let carUIImageView = UIImageView()
        carUIImageView.image = UIImage(
            named: self.currentSetting.data.obstacle[
                Int.random(in: 0..<self.currentSetting.data.obstacle.count)])

        if let height = carUIImageView.image?.size.height {
            if let width = carUIImageView.image?.size.width {
                let carHeight = mainCarWidth * height / width
                carUIImageView.frame = CGRect(
                    x: rightPositionCGRect + mainCarWidth / 2, y: -carHeight,
                    width: self.mainCarWidth,
                    height: carHeight)
            }
        }

        carUIImageView.transform = CGAffineTransform(
            rotationAngle: -Constansts.carAngle)
        carUIImageView.dropShadow(
            opacity: Constansts.carBoxShadowOpacity,
            radius: Constansts.carBoxShadowRadius)
        self.mainView.addSubview(carUIImageView)
        self.mainView.sendSubviewToBack(carUIImageView)
        self.objectsArray.append(carUIImageView)
        UIView.animate(
            withDuration: TimeInterval.random(
                in: Constansts.carTimeSpeedStart...Constansts.carTimeSpeedEnd)
                * self.currentSetting.data.hard, delay: 0,
            options: [.curveLinear]
        ) {
            carUIImageView.frame.origin.y = self.view.frame.height
        } completion: { _ in
            carUIImageView.removeFromSuperview()
            self.objectsArray.remove(at: self.objectsArray.count - 1)
            if !self.endGame {
                self.score += 1
                switch Int.random(in: 0...1) {
                case 0:
                    self.generateRightCar()
                case 1:
                    self.generateLeftCar()
                default:
                    print("ok")
                }
            }
        }
    }

    private func generateRightCar() {
        let carUIImageView = UIImageView()
        carUIImageView.image = UIImage(
            named: self.currentSetting.data.obstacle[
                Int.random(in: 0..<self.currentSetting.data.obstacle.count)])

        if let height = carUIImageView.image?.size.height {
            if let width = carUIImageView.image?.size.width {
                let carHeight = mainCarWidth * height / width
                carUIImageView.frame = CGRect(
                    x: self.borderWidth + self.carWidth + self.mainCarWidth / 2,
                    y: -carHeight, width: self.mainCarWidth,
                    height: carHeight)
            }
        }

        carUIImageView.dropShadow(
            opacity: Constansts.carBoxShadowOpacity,
            radius: Constansts.carBoxShadowRadius)
        self.mainView.addSubview(carUIImageView)
        self.mainView.sendSubviewToBack(carUIImageView)
        self.objectsArray.append(carUIImageView)
        UIView.animate(
            withDuration: TimeInterval.random(
                in: Constansts
                    .carTimeSpeedStartRight...Constansts.carTimeSpeedEndRight)
                * self.currentSetting.data.hard, delay: 0,
            options: [.curveLinear]
        ) {
            carUIImageView.frame.origin.y = self.view.frame.height
        } completion: { _ in
            self.objectsArray.remove(at: self.objectsArray.count - 1)
            carUIImageView.removeFromSuperview()
            if !self.endGame {
                self.score += 1
                switch Int.random(in: 0...1) {
                case 0:
                    self.generateRightCar()
                case 1:
                    self.generateLeftCar()
                default:
                    print("ok")
                }
            }
        }
    }

    private func checkIntersection(checkjObject: UIImageView) {
        print(objectsArray.count)
        for object in objectsArray {
            if let frame1 = object.layer.presentation()?.frame,
                let frame2 = checkjObject.layer.presentation()?.frame
            {
                if frame1.intersects(frame2) {
                    endGame = true
                    playButton.isEnabled = false

                    UIView.animate(withDuration: Constansts.carSpeed) {
                        self.carView.transform = CGAffineTransform(
                            rotationAngle: -Constansts.failAngle)
                    }

                    var count = Constansts.startCount
                    self.playButton.setTitle(String(count), for: .normal)
                    let timer = Timer.scheduledTimer(
                        withTimeInterval: 1, repeats: true
                    ) {
                        timer in
                        count -= 1
                        self.playButton.setTitle(String(count), for: .normal)
                        if count == 1 {
                            UIView.animate(withDuration: Constansts.carSpeed) {
                                self.carView.transform = CGAffineTransform(
                                    rotationAngle: 0)
                                self.carView.frame.origin.x =
                                    self.view.center.x + self.mainCarWidth / 2
                            }
                        }
                        if count <= 0 {
                            timer.invalidate()
                            self.playButton.setTitle(
                                Constansts.playString, for: .normal)
                            self.playButton.isEnabled = true
                        }
                    }

                    playButton.layer.opacity = 1
                    leftButton.isEnabled = false
                    leftButton.layer.opacity = 0
                    rightButton.isEnabled = false
                    rightButton.layer.opacity = 0
                    self.blurViewSecond.layer.opacity = 1
                    self.blurView.layer.opacity = 0
                    scoreLabelFull.text = "End game\nYour score: \(score)"
                    saveResult()
                } else {
                }
            }
        }
    }

    @objc func play() {
        endGame = false
        mainLogic()
    }

    private func saveResult() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = Constansts.timeFormat
        let stringDate = formatter.string(from: date)

        currentUserArray.data.results.append(
            User(
                name: currentSetting.data.nameUser, result: score,
                userImage: currentSetting.data.userImage, userTime: stringDate))
        scoreArray.append(score)
    }

    @objc func back() {
        if !endGame {
            saveResult()
        }
        endGame = true
        StorageManagaer.shared.saveUser(userArray: currentUserArray.data)
        navigationController?.popViewController(animated: true)
    }

    @objc func tapActionLeft() {
        UIView.animate(
            withDuration: Constansts.carSpeed * self.currentSetting.data.hard
        ) {
            self.carView.frame.origin.x -= self.carWidth
        } completion: { _ in
            UIView.animate(withDuration: Constansts.carSpeed) {
            }

        }
    }

    @objc func tapActionRight() {
        UIView.animate(
            withDuration: Constansts.carSpeed * self.currentSetting.data.hard
        ) {
            self.carView.frame.origin.x += self.carWidth
        } completion: { _ in
            UIView.animate(withDuration: Constansts.carSpeed) {
            }

        }
    }

}
