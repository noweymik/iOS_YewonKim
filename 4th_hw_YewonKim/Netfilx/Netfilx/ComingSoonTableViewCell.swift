//
//  ComingSoonTableViewCell.swift
//  Netfilx
//
//  Created by yewoni on 4/9/24.
//

import UIKit

class ComingSoonTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ComingSoonTableViewCell")
        contentView.backgroundColor = UIColor.black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Movie 이미지
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // releaseDate 라벨
    let releaseDate_label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // title 라벨
    let title_label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // description 라벨
    let description_label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // genre 라벨
    let genre_label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Remind me 버튼
    let remindme_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 7
        config.imagePlacement = .top
        
        if let image = UIImage(named: "remind-me") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        
        var titleAttr = AttributedString.init("Remind Me")
        titleAttr.font = .systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = titleAttr
  
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Share 버튼
    let share_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 7
        config.imagePlacement = .top
        
        if let image = UIImage(named: "share") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        
        var titleAttr = AttributedString.init("Share")
        titleAttr.font = .systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = titleAttr
  
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private func setupUI() {
        contentView.addSubview(movieImage)
        contentView.addSubview(remindme_button)
        contentView.addSubview(share_button)
        contentView.addSubview(releaseDate_label)
        contentView.addSubview(title_label)
        contentView.addSubview(description_label)
        contentView.addSubview(genre_label)
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 200),
            movieImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            remindme_button.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            remindme_button.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -175),
            
            share_button.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            share_button.leadingAnchor.constraint(equalTo: remindme_button.trailingAnchor, constant: 25),
            
            releaseDate_label.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 75),
            releaseDate_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            releaseDate_label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            title_label.topAnchor.constraint(equalTo: releaseDate_label.bottomAnchor, constant: 12),
            title_label.leadingAnchor.constraint(equalTo: releaseDate_label.leadingAnchor),
            title_label.trailingAnchor.constraint(equalTo: releaseDate_label.trailingAnchor),
            
            description_label.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 12),
            description_label.leadingAnchor.constraint(equalTo: title_label.leadingAnchor),
            description_label.trailingAnchor.constraint(equalTo: title_label.trailingAnchor),
            
            genre_label.topAnchor.constraint(equalTo: description_label.bottomAnchor, constant: 10),
            genre_label.leadingAnchor.constraint(equalTo: description_label.leadingAnchor),
            genre_label.trailingAnchor.constraint(equalTo: description_label.trailingAnchor),
            genre_label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

