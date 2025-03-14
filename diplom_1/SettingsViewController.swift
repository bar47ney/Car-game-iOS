//
//  SettingsViewController.swift
//  diplom_1
//
//  Created by Сергей Недведский on 9.01.25.
//

import SnapKit
import UIKit

final class SettingsViewController: UIViewController {

    private let backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()

    private let carLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.settingCarString
        label.textColor = Constansts.settingColor
        label.textAlignment = Constansts.settingAlign
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let obstacleLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.settingObstacleString
        label.textColor = Constansts.settingColor
        label.textAlignment = Constansts.settingAlign
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let speedLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.settingSpeedString
        label.textColor = Constansts.settingColor
        label.textAlignment = Constansts.settingAlign
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let currentSettingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = Constansts.settingAlign
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private let carBlockView: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.settingBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.roundCorners()
        return view
    }()

    private let carViewFirst: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.firstCar)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let carViewSecond: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.secondCar)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let carViewThird: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.thirdCar)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let obstacleViewFirst: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.firstObstacle)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let obstacleViewSecond: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.secondObstacle)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let obstacleViewThird: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.thirdObstacle)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let hardViewFirst: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.firstSpeed)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let hardViewSecond: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.secondSpeed)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let hardViewThird: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constansts.thirdSpeed)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let obstacleBlockView: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.settingBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.roundCorners()
        return view
    }()

    private let hardBlockView: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.settingBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.roundCorners()
        return view
    }()

    private let userNameBlockView: UIView = {
        let view = UIView()
        view.backgroundColor = Constansts.settingBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.roundCorners()
        return view
    }()

    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.roundCorners()
        return view
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constansts.settingName
        textField.borderStyle = .roundedRect
        textField.roundCorners()
        return textField
    }()

    private let viewSecond: UIView = {
        let view = UIView()
        return view
    }()

    private let currentSetting = StorageManagaer.shared.loadSettings()

    private var ifPicker = false

    override func viewDidLoad() {
        super.viewDidLoad()

        getSettingLabel()

        self.view.backgroundColor = Constansts.settingViewBackgroundColor

        self.view.addSubview(viewSecond)
        viewSecond.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        self.viewSecond.addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(
                equalTo: viewSecond.topAnchor,
                constant: Constansts.settingStepTop),
            userImageView.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor,
                constant: Constansts.userImageWidth),
            userImageView.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor,
                constant: -Constansts.userImageWidth),
        ])

        self.viewSecond.addSubview(currentSettingLabel)
        NSLayoutConstraint.activate([
            currentSettingLabel.topAnchor.constraint(
                equalTo: userImageView.bottomAnchor, constant: Constansts.step),
            currentSettingLabel.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor, constant: Constansts.step),
            currentSettingLabel.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor, constant: -Constansts.step),
            currentSettingLabel.heightAnchor.constraint(
                equalTo: userImageView.heightAnchor),
        ])

        self.viewSecond.addSubview(carBlockView)
        NSLayoutConstraint.activate([
            carBlockView.topAnchor.constraint(
                equalTo: currentSettingLabel.bottomAnchor,
                constant: Constansts.step),
            carBlockView.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor, constant: Constansts.step),
            carBlockView.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor, constant: -Constansts.step),
            carBlockView.heightAnchor.constraint(
                equalTo: currentSettingLabel.heightAnchor),
        ])

        self.viewSecond.addSubview(obstacleBlockView)
        NSLayoutConstraint.activate([
            obstacleBlockView.topAnchor.constraint(
                equalTo: carBlockView.bottomAnchor, constant: Constansts.step),
            obstacleBlockView.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor, constant: Constansts.step),
            obstacleBlockView.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor, constant: -Constansts.step),
            obstacleBlockView.heightAnchor.constraint(
                equalTo: carBlockView.heightAnchor),
        ])

        self.viewSecond.addSubview(hardBlockView)
        NSLayoutConstraint.activate([
            hardBlockView.topAnchor.constraint(
                equalTo: obstacleBlockView.bottomAnchor,
                constant: Constansts.step),
            hardBlockView.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor, constant: Constansts.step),
            hardBlockView.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor, constant: -Constansts.step),
            hardBlockView.heightAnchor.constraint(
                equalTo: obstacleBlockView.heightAnchor),
        ])

        self.viewSecond.addSubview(userNameBlockView)
        NSLayoutConstraint.activate([
            userNameBlockView.topAnchor.constraint(
                equalTo: hardBlockView.bottomAnchor, constant: Constansts.step),
            userNameBlockView.leftAnchor.constraint(
                equalTo: viewSecond.leftAnchor, constant: Constansts.step),
            userNameBlockView.rightAnchor.constraint(
                equalTo: viewSecond.rightAnchor, constant: -Constansts.step),
            userNameBlockView.heightAnchor.constraint(
                equalTo: hardBlockView.heightAnchor),
            userNameBlockView.bottomAnchor.constraint(
                equalTo: viewSecond.bottomAnchor,
                constant: -Constansts.settingStepTop
            ),
        ])

        userNameBlockView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(
                equalTo: userNameBlockView.topAnchor, constant: 0),
            nameTextField.leftAnchor.constraint(
                equalTo: userNameBlockView.leftAnchor, constant: 0),
            nameTextField.rightAnchor.constraint(
                equalTo: userNameBlockView.rightAnchor, constant: 0),
            nameTextField.bottomAnchor.constraint(
                equalTo: userNameBlockView.bottomAnchor, constant: 0),
        ])

        carBlockView.addSubview(carLabel)
        NSLayoutConstraint.activate([
            carLabel.topAnchor.constraint(
                equalTo: carBlockView.topAnchor, constant: 0),
            carLabel.leftAnchor.constraint(
                equalTo: carBlockView.leftAnchor, constant: 0),
            carLabel.rightAnchor.constraint(
                equalTo: carBlockView.rightAnchor, constant: 0),
        ])

        obstacleBlockView.addSubview(obstacleLabel)
        NSLayoutConstraint.activate([
            obstacleLabel.topAnchor.constraint(
                equalTo: obstacleBlockView.topAnchor, constant: 0),
            obstacleLabel.leftAnchor.constraint(
                equalTo: obstacleBlockView.leftAnchor, constant: 0),
            obstacleLabel.rightAnchor.constraint(
                equalTo: obstacleBlockView.rightAnchor, constant: 0),
        ])

        hardBlockView.addSubview(speedLabel)
        NSLayoutConstraint.activate([
            speedLabel.topAnchor.constraint(
                equalTo: hardBlockView.topAnchor, constant: 0),
            speedLabel.leftAnchor.constraint(
                equalTo: hardBlockView.leftAnchor, constant: 0),
            speedLabel.rightAnchor.constraint(
                equalTo: hardBlockView.rightAnchor, constant: 0),
        ])

        carBlockView.addSubview(carViewFirst)
        NSLayoutConstraint.activate([
            carViewFirst.topAnchor.constraint(
                equalTo: carLabel.bottomAnchor, constant: Constansts.settingStep
            ),
            carViewFirst.leftAnchor.constraint(
                equalTo: carBlockView.leftAnchor, constant: 0),
            carViewFirst.heightAnchor.constraint(
                equalTo: carLabel.heightAnchor),
            carViewFirst.bottomAnchor.constraint(
                equalTo: carBlockView.bottomAnchor, constant: 0),
        ])

        carBlockView.addSubview(carViewSecond)
        NSLayoutConstraint.activate([
            carViewSecond.topAnchor.constraint(
                equalTo: carLabel.bottomAnchor, constant: Constansts.settingStep
            ),
            carViewSecond.leftAnchor.constraint(
                equalTo: carViewFirst.rightAnchor,
                constant: Constansts.settingStep),
            carViewSecond.widthAnchor.constraint(
                equalTo: carViewFirst.widthAnchor),
            carViewSecond.heightAnchor.constraint(
                equalTo: carLabel.heightAnchor),
            carViewSecond.bottomAnchor.constraint(
                equalTo: carBlockView.bottomAnchor, constant: 0),
        ])

        carBlockView.addSubview(carViewThird)
        NSLayoutConstraint.activate([
            carViewThird.topAnchor.constraint(
                equalTo: carLabel.bottomAnchor, constant: Constansts.settingStep
            ),
            carViewThird.leftAnchor.constraint(
                equalTo: carViewSecond.rightAnchor,
                constant: Constansts.settingStep),
            carViewThird.rightAnchor.constraint(
                equalTo: carBlockView.rightAnchor, constant: 0),
            carViewThird.widthAnchor.constraint(
                equalTo: carViewSecond.widthAnchor),
            carViewThird.heightAnchor.constraint(
                equalTo: carLabel.heightAnchor),
            carViewThird.bottomAnchor.constraint(
                equalTo: carBlockView.bottomAnchor, constant: 0),
        ])

        obstacleBlockView.addSubview(obstacleViewFirst)
        NSLayoutConstraint.activate([
            obstacleViewFirst.topAnchor.constraint(
                equalTo: obstacleLabel.bottomAnchor,
                constant: Constansts.settingStep),
            obstacleViewFirst.leftAnchor.constraint(
                equalTo: obstacleBlockView.leftAnchor, constant: 0),
            obstacleViewFirst.heightAnchor.constraint(
                equalTo: obstacleLabel.heightAnchor),
            obstacleViewFirst.bottomAnchor.constraint(
                equalTo: obstacleBlockView.bottomAnchor, constant: 0),
        ])

        obstacleBlockView.addSubview(obstacleViewSecond)
        NSLayoutConstraint.activate([
            obstacleViewSecond.topAnchor.constraint(
                equalTo: obstacleLabel.bottomAnchor,
                constant: Constansts.settingStep),
            obstacleViewSecond.leftAnchor.constraint(
                equalTo: obstacleViewFirst.rightAnchor,
                constant: Constansts.settingStep),
            obstacleViewSecond.widthAnchor.constraint(
                equalTo: obstacleViewFirst.widthAnchor),
            obstacleViewSecond.heightAnchor.constraint(
                equalTo: obstacleLabel.heightAnchor),
            obstacleViewSecond.bottomAnchor.constraint(
                equalTo: obstacleBlockView.bottomAnchor, constant: 0),
        ])

        obstacleBlockView.addSubview(obstacleViewThird)
        NSLayoutConstraint.activate([
            obstacleViewThird.topAnchor.constraint(
                equalTo: obstacleLabel.bottomAnchor,
                constant: Constansts.settingStep),
            obstacleViewThird.leftAnchor.constraint(
                equalTo: obstacleViewSecond.rightAnchor,
                constant: Constansts.settingStep),
            obstacleViewThird.rightAnchor.constraint(
                equalTo: obstacleBlockView.rightAnchor, constant: 0),
            obstacleViewThird.widthAnchor.constraint(
                equalTo: obstacleViewSecond.widthAnchor),
            obstacleViewThird.heightAnchor.constraint(
                equalTo: obstacleLabel.heightAnchor),
            obstacleViewThird.bottomAnchor.constraint(
                equalTo: obstacleBlockView.bottomAnchor, constant: 0),
        ])

        hardBlockView.addSubview(hardViewFirst)
        NSLayoutConstraint.activate([
            hardViewFirst.topAnchor.constraint(
                equalTo: speedLabel.bottomAnchor,
                constant: Constansts.settingStep),
            hardViewFirst.leftAnchor.constraint(
                equalTo: hardBlockView.leftAnchor, constant: 0),
            hardViewFirst.heightAnchor.constraint(
                equalTo: speedLabel.heightAnchor),
            hardViewFirst.bottomAnchor.constraint(
                equalTo: hardBlockView.bottomAnchor, constant: 0),
        ])

        hardBlockView.addSubview(hardViewSecond)
        NSLayoutConstraint.activate([
            hardViewSecond.topAnchor.constraint(
                equalTo: speedLabel.bottomAnchor,
                constant: Constansts.settingStep),
            hardViewSecond.leftAnchor.constraint(
                equalTo: hardViewFirst.rightAnchor,
                constant: Constansts.settingStep),
            hardViewSecond.widthAnchor.constraint(
                equalTo: hardViewFirst.widthAnchor),
            hardViewSecond.heightAnchor.constraint(
                equalTo: speedLabel.heightAnchor),
            hardViewSecond.bottomAnchor.constraint(
                equalTo: hardBlockView.bottomAnchor, constant: 0),
        ])

        hardBlockView.addSubview(hardViewThird)
        NSLayoutConstraint.activate([
            hardViewThird.topAnchor.constraint(
                equalTo: speedLabel.bottomAnchor,
                constant: Constansts.settingStep),
            hardViewThird.leftAnchor.constraint(
                equalTo: hardViewSecond.rightAnchor,
                constant: Constansts.settingStep),
            hardViewThird.rightAnchor.constraint(
                equalTo: hardBlockView.rightAnchor, constant: 0),
            hardViewThird.widthAnchor.constraint(
                equalTo: hardViewSecond.widthAnchor),
            hardViewThird.heightAnchor.constraint(
                equalTo: speedLabel.heightAnchor),
            hardViewThird.bottomAnchor.constraint(
                equalTo: hardBlockView.bottomAnchor, constant: 0),
        ])

        backView.image = UIImage(named: Constansts.backImage)
        backView.frame = CGRect(
            x: Constansts.backLeft, y: Constansts.backTop,
            width: Constansts.backSize,
            height: Constansts.backSize)
        viewSecond.addSubview(backView)

        let back = UITapGestureRecognizer(
            target: self, action: #selector(back))
        backView.addGestureRecognizer(back)

        let firtsCar = UITapGestureRecognizer(
            target: self, action: #selector(firtsCar(_:)))
        carViewFirst.addGestureRecognizer(firtsCar)

        let secondCar = UITapGestureRecognizer(
            target: self, action: #selector(secondCar))
        carViewSecond.addGestureRecognizer(secondCar)

        let thirdCar = UITapGestureRecognizer(
            target: self, action: #selector(thirdCar))
        carViewThird.addGestureRecognizer(thirdCar)

        let firtsObstacle = UITapGestureRecognizer(
            target: self, action: #selector(firtsObstacle))
        obstacleViewFirst.addGestureRecognizer(firtsObstacle)

        let secondObstacle = UITapGestureRecognizer(
            target: self, action: #selector(secondObstacle))
        obstacleViewSecond.addGestureRecognizer(secondObstacle)

        let thirdObstacle = UITapGestureRecognizer(
            target: self, action: #selector(thirdObstacle))
        obstacleViewThird.addGestureRecognizer(thirdObstacle)

        let firtsSpeed = UITapGestureRecognizer(
            target: self, action: #selector(firtsHard))
        hardViewFirst.addGestureRecognizer(firtsSpeed)

        let secondSpeed = UITapGestureRecognizer(
            target: self, action: #selector(secondHard))
        hardViewSecond.addGestureRecognizer(secondSpeed)

        let thirdSpeed = UITapGestureRecognizer(
            target: self, action: #selector(thirdHard))
        hardViewThird.addGestureRecognizer(thirdSpeed)

        let tapActionUserImage = UITapGestureRecognizer(
            target: self, action: #selector(tapActionUserImage))
        userImageView.addGestureRecognizer(tapActionUserImage)

        let tapDetected = UITapGestureRecognizer(
            target: self, action: #selector(tapDetected))
        viewSecond.addGestureRecognizer(tapDetected)

        registerKeyboardNotification()
    }

    func animBtn(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            UIView.animate(withDuration: 0.3) {
                tappedView.backgroundColor =
                    Constansts.settingBackgroundColorActive
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    tappedView.backgroundColor = .clear
                }
            }
        }
    }

    func getSettingLabel() {

        var hard = Constansts.hardEasyString
        var car = Constansts.firstCarString
        var obstacle = Constansts.firstObstacleString

        switch currentSetting.data.hard {
        case Constansts.hardEasy:
            hard = Constansts.hardEasyString
        case Constansts.hardMedium:
            hard = Constansts.hardMediumString
        case Constansts.hardHard:
            hard = Constansts.hardHardString
        default:
            break
        }

        switch currentSetting.data.obstacle {
        case Constansts.obstacleArray:
            obstacle = Constansts.firstObstacleString
        case Constansts.obstacleArraySecond:
            obstacle = Constansts.secondObstacleString
        case Constansts.obstacleArrayThird:
            obstacle = Constansts.thirdObstacleString
        default:
            break
        }

        switch currentSetting.data.carImage {
        case Constansts.firstCar:
            car = Constansts.firstCarString
        case Constansts.secondCar:
            car = Constansts.secondCarString
        case Constansts.thirdCar:
            car = Constansts.thirdCarString
        default:
            break
        }

        currentSettingLabel.text =
            "\(currentSetting.data.nameUser)\n\(car)\n\(obstacle)\n\(hard)\n"

        if !ifPicker {
            if let image = StorageManagaer.shared.loadImage(
                filename: currentSetting.data.userImage)
            {
                userImageView.image = image
            } else {
                userImageView.image = UIImage(
                    named: Constansts.defaultUserImage)
            }
        }
    }

    @objc func firtsCar(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setCar(car: Constansts.firstCar)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func secondCar(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setCar(car: Constansts.secondCar)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func thirdCar(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setCar(car: Constansts.thirdCar)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func firtsObstacle(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setObstacle(
            obstacle: Constansts.anotherCarImageArray)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func secondObstacle(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setObstacle(
            obstacle: Constansts.obstacleArraySecond)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func thirdObstacle(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setObstacle(obstacle: Constansts.obstacleArrayThird)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func firtsHard(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setHard(hard: Constansts.hardEasy)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func secondHard(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setHard(hard: Constansts.hardMedium)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func thirdHard(_ sender: UITapGestureRecognizer) {
        currentSetting.data.setHard(hard: Constansts.hardHard)
        animBtn(sender)
        getSettingLabel()
    }

    @objc func back() {
        if let name = nameTextField.text {
            if !name.isEmpty {
                currentSetting.data.setName(name: name)
            }
        }

        let image = userImageView.image!
        if ifPicker {
            guard let imageName = StorageManagaer.shared.savelmage(image) else {
                return
            }
            currentSetting.data.setImage(userImage: imageName)
        } else {
            currentSetting.data.setImage(
                userImage: currentSetting.data.userImage)
        }

        StorageManagaer.shared.saveSetting(setting: currentSetting.data)
        navigationController?.popViewController(animated: true)
    }

    @objc func tapActionUserImage() {
        showPickerAlert()
    }

    func showPickerAlert() {
        let alert = UIAlertController(
            title: Constansts.pickerTitle, message: nil,
            preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(
            title: Constansts.pickerCamera, style: .default
        ) { _ in
            self.showPicker(with: .camera)
            self.ifPicker = true
        }
        alert.addAction(cameraAction)

        let libraryAction = UIAlertAction(
            title: Constansts.pickerGallery, style: .default
        ) { _ in
            self.showPicker(with: .photoLibrary)
            self.ifPicker = true
        }
        alert.addAction(libraryAction)

        let cacelAction = UIAlertAction(
            title: Constansts.pickerCancel, style: .cancel)
        alert.addAction(cacelAction)

        present(alert, animated: true)
    }

    func showPicker(with source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            print(Constansts.pickerError)
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.allowsEditing = true
        picker.delegate = self

        present(picker, animated: true)
    }

    @objc func tapDetected() {
        view.endEditing(true)
    }

    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardChangedFrame(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardChangedFrame(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardChangedFrame(_ notification: Notification) {
        guard let info = notification.userInfo,
            let duration =
                (info[UIResponder.keyboardAnimationDurationUserInfoKey]
                as? NSNumber)?.doubleValue,
            let frame =
                (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
                .cgRectValue
        else { return }

        var offset: CGFloat = 0
        if notification.name == UIResponder.keyboardWillHideNotification {
            offset = 0
        } else if notification.name == UIResponder.keyboardWillShowNotification
        {
            offset = -frame.height
        }

        viewSecond.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(offset)
            make.top.equalToSuperview().offset(offset)
        }

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}

extension SettingsViewController: UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey:
            Any]
    ) {
        var chosenImage = UIImage()

        if let image = info[.editedImage] as? UIImage {
            chosenImage = image
        } else if let image = info[
            UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            chosenImage = image
        }
        userImageView.image = chosenImage

        picker.dismiss(animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
