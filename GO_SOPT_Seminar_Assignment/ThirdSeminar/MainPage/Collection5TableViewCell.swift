//
//  Collection5TableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class Collection5TableViewCell: UITableViewCell {
    
    private let dummy = MainPage.dummy()

    private let titleLabel = UILabel()
    private let entireLabel = UILabel()
    private let entireButton = UIButton()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.text = "마술보다 더 신비로운 영화(신비로운 영화사전님)"
            $0.font = .tvingSemiBold(ofSize: 15)
            $0.textColor = .white
        }
        
        entireLabel.do {
            $0.text = "전체보기 "
            $0.font = .tvingSemiBold(ofSize: 10)
            $0.textColor = .tvingGray6
        }
        
        entireButton.do {
            $0.setImage(.arrowImage, for: .normal)
        }
        
        collectionView.do {
            $0.register(MainPageContentsCollectionViewCell.self, forCellWithReuseIdentifier: MainPageContentsCollectionViewCell.className)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.dataSource = self
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: 98, height: 160)
            $0.scrollDirection = .horizontal
        }

        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .black
    }
    
    func setLayout() {
        contentView.addSubviews(titleLabel, entireLabel, entireButton, collectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview()
        }
        entireLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(12)
        }
        entireButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY).offset(1)
            $0.trailing.equalToSuperview().inset(3)
            $0.width.equalTo(10)
            $0.height.equalTo(10)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).offset(3)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureCell() {
        
    }

}

extension Collection5TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MainPageContentsCollectionViewCell.className, for: indexPath) as? MainPageContentsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummy[indexPath.item])

        return cell
    }
}
