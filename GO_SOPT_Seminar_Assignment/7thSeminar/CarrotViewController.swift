//
//  CarrotViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

import RealmSwift

final class CarrotViewController: UIViewController {
    
    private let tableView = UITableView()
        
    private lazy var dummy: [RealmModel] = getRealm() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
//        getData()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func setStyle() {
                
        tableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.className)
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
    
//    func getData() {
//        let realmBegin = try! Realm()
//
//        try! realmBegin.write {
//
//            dummy.forEach { mm in
//                let model = RealmModel(imageName: "hypeBoy", title: mm.title, place: mm.place, time: mm.time, price: mm.price, tradeStatus: mm.tradeStatus.title)
//                realmBegin.add(model)
//            }
//        }
//
//    }
    
    private func getRealm() -> [RealmModel] {
        let realm = try! Realm()
        let result = realm.objects(RealmModel.self)
//        let resultLiked = realm.objects(RealmModel.self).filter(NSPredicate(format: "liked = %@", true))
        var array: [RealmModel] = []
        result.forEach {
            array.append($0)
        }
        return array
    }
}

extension CarrotViewController: UITableViewDelegate {}

extension CarrotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.className, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        let realm = try! Realm()
        cell.configureCell(dummy[indexPath.row])

        cell.handler = { [weak self] in
            guard let self else { return }
            try! realm.write({
                guard let object = realm.object(ofType: RealmModel.self, forPrimaryKey: self.dummy[indexPath.row]._id) else { return }
                print(object.liked)
                object.liked.toggle()
                print(object.liked)
                return
            })

        }
        
        return cell
    }
}



