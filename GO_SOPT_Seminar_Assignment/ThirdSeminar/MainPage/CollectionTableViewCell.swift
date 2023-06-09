//
//  CollectionTableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

// MARK: - TableView section 0의 cell 설정

final class CollectionTableViewCell: UITableViewCell {
                
    private let dummy = MainPagePhoto.dummy()
    
    // MARK: - TableViewCell안에서 collectionView 생성
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
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
            $0.isPagingEnabled = true
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 520)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
            $0.scrollDirection = .horizontal
            $0.estimatedItemSize = .zero
        }
        
        headerPageControl.do {
            $0.numberOfPages = 4
            $0.pageIndicatorTintColor = .tvingGray4
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = .white
            $0.isUserInteractionEnabled = false
            $0.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            $0.backgroundStyle = .minimal
            $0.allowsContinuousInteraction = false
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .black
    }
    
    func setLayout() {
        contentView.addSubviews(collectionView,headerPageControl)
        
        collectionView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(520)
        }
        
        headerPageControl.snp.makeConstraints {
            $0.top.equalToSuperview().inset(540)
        }
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MainPageHeaderCollectionViewCell.className, for: indexPath) as? MainPageHeaderCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(dummy[indexPath.item])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width/2)
        
        let newPage = Int(x/width)
        if headerPageControl.currentPage != newPage {
            headerPageControl.currentPage = newPage
        }
    }
    
}


