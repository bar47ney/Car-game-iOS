//
//  ListViewController.swift
//  diplom_1
//
//  Created by Сергей Недведский on 19.01.25.
//

import SnapKit
import UIKit

class ListViewController: UIViewController {

    private var array = StorageManagaer.shared.loadUsers().data.results.sorted(
        by: { $0.result > $1.result })

    private let backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.image = UIImage(named: Constansts.backImage)
        return view
    }()

    private let emptyListLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.text = Constansts.emptyListString
        label.textAlignment = .center
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(
            ListTableViewCell.self,
            forCellReuseIdentifier: ListTableViewCell.identifer)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = .leastNonzeroMagnitude

        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white

        if array.isEmpty {
            view.addSubview(emptyListLabel)
            emptyListLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        } else {
            view.addSubview(tableView)
            tableView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(
                    Constansts.backTop + Constansts.backSize)
                make.left.equalToSuperview().inset(Constansts.step)
                make.right.equalToSuperview().inset(Constansts.step)
                make.bottom.equalToSuperview().inset(Constansts.step)
            }
        }

        backView.frame = CGRect(
            x: Constansts.backLeft, y: Constansts.backTop,
            width: Constansts.backSize,
            height: Constansts.backSize)
        view.addSubview(backView)

        let back = UITapGestureRecognizer(
            target: self, action: #selector(back))
        backView.addGestureRecognizer(back)
    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        print(array.count)
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ListTableViewCell.identifer, for: indexPath)
                as? ListTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: array[indexPath.row])

        return cell
    }
}
