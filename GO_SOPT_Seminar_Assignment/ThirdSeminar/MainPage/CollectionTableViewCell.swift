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
    
    weak var cellDelegate: GoToMyPageButtonAction?
    
    private let dummy = MainPagePhoto.dummy()
    
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
            $0.numberOfPages = 8
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
    
    func configureCell() {
        
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MainPageHeaderCollectionViewCell.className, for: indexPath) as? MainPageHeaderCollectionViewCell else { return UICollectionViewCell() }
        cell.cellDelegate = self
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.headerPageControl.currentPage = page
    }
}

extension CollectionTableViewCell: GoToMyPageButtonAction {
    func gotoMyPageButtonTapped() {
        cellDelegate?.gotoMyPageButtonTapped()
    }
}

