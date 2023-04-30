//
//  CollectionTableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class CollectionTableViewCell: UITableViewCell {

    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

    private let tvingTitle = UIImageView()
    private let goToMyPageButton = UIButton()
    private let headerPageControl = UIPageControl()
    
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
        
        collectionView.do {
            $0.register(MainPageHeaderCollectionViewCell.self, forCellWithReuseIdentifier: MainPageHeaderCollectionViewCell.className)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.dataSource = self
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: 390, height: 500)
            $0.scrollDirection = .horizontal
        }
        
        tvingTitle.do {
            $0.image = .tvingTitleImage
        }
        
        goToMyPageButton.do {
            $0.setImage(.gotoMyPageButton, for: .normal)
        }
        
        headerPageControl.do {
            $0.numberOfPages = 8
            $0.currentPage = 0
            $0.pageIndicatorTintColor = .tvingGray4
            $0.currentPageIndicatorTintColor = .white
        }

        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .black
    }
    
    func setLayout() {
        contentView.addSubviews(collectionView,headerPageControl)
        
        collectionView.addSubviews(tvingTitle, goToMyPageButton)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tvingTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        goToMyPageButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingTitle.snp.centerY)
            $0.leading.equalTo(tvingTitle.snp.trailing).offset(240)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        headerPageControl.snp.makeConstraints {
            $0.top.equalToSuperview().inset(535)
        }
    }
    
    func configureCell() {
        
    }

}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MainPageHeaderCollectionViewCell.className, for: indexPath) as? MainPageHeaderCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell()

        return cell
    }
}
