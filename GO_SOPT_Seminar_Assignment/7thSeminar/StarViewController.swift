//
//  StarViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

import RealmSwift
import SnapKit
import Then

final class StarViewController: UIViewController {
    
    private let tableView = UITableView()
    
    let realm = try! Realm()

    private lazy var dummy: [RealmModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dummy = getRealm()
        self.tableView.reloadData()
    }
    
    func setStyle() {
                
        tableView.do {
            $0.register(StarTableViewCell.self, forCellReuseIdentifier: StarTableViewCell.className)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func getRealm() -> [RealmModel] {
        let resultLiked = realm.objects(RealmModel.self).filter("liked = %@", true)
        
//        objects(RealmModel.self).filter(NSPredicate(format: "liked = %@", true))
        var array: [RealmModel] = []
        resultLiked.forEach {
            array.append($0)
        }
        return array
    }
    
}

extension StarViewController: UITableViewDelegate {}

extension StarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StarTableViewCell.className, for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}
