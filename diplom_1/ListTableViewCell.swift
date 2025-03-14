//
//  ListTableViewCell.swift
//  diplom_1
//
//  Created by Сергей Недведский on 19.01.25.
//

import SnapKit
import UIKit

class ListTableViewCell: UITableViewCell {

    static var identifer: String { "\(Self.self)" }

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.roundCorners()
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
        label.text = nil
        scoreLabel.text = nil
        timeLabel.text = nil
    }

    private func configureUI() {
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constansts.step)
            make.left.equalToSuperview().offset(Constansts.step)
            make.height.equalTo(Constansts.userRecordsImageHeight)
        }

        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constansts.step)
            make.left.equalTo(userImageView.snp.right).offset(Constansts.step)
            make.bottom.equalToSuperview().offset(-Constansts.step)
            make.width.equalTo(userImageView).multipliedBy(3)
        }

        contentView.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constansts.step)
            make.left.equalTo(label.snp.right).offset(Constansts.step)
            make.bottom.equalToSuperview().offset(-Constansts.step)
            make.width.equalTo(label)
        }

        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constansts.step)
            make.left.equalTo(scoreLabel.snp.right).offset(Constansts.step)
            make.bottom.right.equalToSuperview().offset(-Constansts.step)
            make.width.equalTo(scoreLabel)
        }
    }

    func configure(with user: User) {
        label.text = user.name
        scoreLabel.text = String(user.result)
        timeLabel.text = user.userTime
        var myImage: UIImage?
        let newSize = CGSize(
            width: Constansts.widthHeightImage,
            height: Constansts.widthHeightImage)
        DispatchQueue.global().async {
            if let image = StorageManagaer.shared.loadImage(
                filename: user.userImage)
            {
                myImage = image
            } else {
                myImage = UIImage(
                    named: Constansts.defaultUserImage)
            }
            if let myImage = myImage {
                if let resizedImage = myImage.resized(to: newSize) {
                    DispatchQueue.main.async {
                        self.userImageView.image = resizedImage
                    }
                }
            }
        }
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
