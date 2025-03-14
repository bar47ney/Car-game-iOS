//
//  InitialViewController.swift
//  diplom_1
//
//  Created by Сергей Недведский on 8.01.25.
//

import UIKit

final class InitialViewController: UIViewController {

    private let playLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.playString
        label.textColor = Constansts.menuColor
        label.backgroundColor = Constansts.menuBackgroundColor
        label.textAlignment = Constansts.menuAlign
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.roundCorners()
        return label
    }()

    private let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.settingString
        label.textColor = Constansts.menuColor
        label.backgroundColor = Constansts.menuBackgroundColor
        label.textAlignment = Constansts.menuAlign
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.roundCorners()
        return label
    }()
    
    private let recordsLabel: UILabel = {
        let label = UILabel()
        label.text = Constansts.tableOfRecordsString
        label.textColor = Constansts.menuColor
        label.backgroundColor = Constansts.menuBackgroundColor
        label.textAlignment = Constansts.menuAlign
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.roundCorners()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Constansts.menuViewBackgroundColor

        self.view.addSubview(playLabel)
        NSLayoutConstraint.activate([
            playLabel.topAnchor.constraint(
                equalTo: view.topAnchor, constant: Constansts.stepTop),
            playLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor, constant: Constansts.step),
            playLabel.rightAnchor.constraint(
                equalTo: view.rightAnchor, constant: -Constansts.step),
        ])
        
        self.view.addSubview(settingsLabel)
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(
                equalTo: playLabel.bottomAnchor, constant: Constansts.step),
            settingsLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor, constant: Constansts.step),
            settingsLabel.rightAnchor.constraint(
                equalTo: view.rightAnchor, constant: -Constansts.step),
            settingsLabel.heightAnchor.constraint(
                equalTo: playLabel.heightAnchor),
        ])

        self.view.addSubview(recordsLabel)
        NSLayoutConstraint.activate([
            recordsLabel.topAnchor.constraint(
                equalTo: settingsLabel.bottomAnchor, constant: Constansts.step),
            recordsLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor, constant: Constansts.step),
            recordsLabel.rightAnchor.constraint(
                equalTo: view.rightAnchor, constant: -Constansts.step),
            recordsLabel.heightAnchor.constraint(
                equalTo: settingsLabel.heightAnchor),
            recordsLabel.bottomAnchor.constraint(
                equalTo: view.bottomAnchor, constant: -Constansts.stepTop),
        ])
        
        let playAction = UITapGestureRecognizer(
            target: self, action: #selector(playAction))
        playLabel.addGestureRecognizer(playAction)
        
        let settingsAction = UITapGestureRecognizer(
            target: self, action: #selector(settingsAction))
        settingsLabel.addGestureRecognizer(settingsAction)
        
        let recordsAction = UITapGestureRecognizer(
            target: self, action: #selector(recordsAction))
        recordsLabel.addGestureRecognizer(recordsAction)
    }

    @objc func playAction() {
        let controller = ViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

    @objc func settingsAction() {
        let controller = SettingsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func recordsAction() {
        let controller = ListViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}
