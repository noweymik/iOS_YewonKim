////
////  MovieCollectionViewCell.swift
////  Netfilx
////
////  Created by yewoni on 4/4/24.
////
//
//import UIKit
//
//class MovieCollectionViewCell: UICollectionViewCell {
//    
//    var imageView: UIImageView!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setupImageView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupImageView() {
//        imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true // 이미지가 셀을 벗어나지 않도록 클립합니다.
//        contentView.addSubview(imageView)
//        
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//}
//
