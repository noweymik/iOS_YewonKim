//
//  SearchTableViewCell.swift
//  Netfilx
//
//  Created by yewoni on 4/7/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    // cell에 쓰일 변수 설정
    let movieImage = UIImageView()
    let movieTitle = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SearchTableViewCell")
        
        // contentView에 추가
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
        setConstraint()
    }
    
    // constraint 설정
    func setConstraint(){
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // movie image constraint 설정
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 144),
            
            // movie title constraint 설정
            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieTitle.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 20),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


