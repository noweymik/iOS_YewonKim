//
//  SearchDetailTableViewCell.swift
//  Netfilx
//
//  Created by yewoni on 4/14/24.
//

// MARK: TODO - custom tabBar 만들기
import UIKit

class SearchDetailTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SearchDetailTableViewCell")
        
        contentView.backgroundColor = UIColor.black
        setUI()
        
        // mirror button이랑 close button 동그랗게 하는 코드
        // 버튼 가로 세로 길이가 32로 설정되어있어서 그것의 반(32/2 == 16)으로 설정
        self.mirror_button.layer.masksToBounds = true
        self.mirror_button.layer.cornerRadius = 16
        self.close_button.layer.masksToBounds = true
        self.close_button.layer.cornerRadius = 16
    }
    
    // mirror button
    let mirror_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0) // 어두운 배경색 설정
        config.image = UIImage(named: "mirror")
        let button = UIButton(type: .system)
        button.configuration = config
        return button
    }()
    
    // close button
    let close_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0) // 어두운 배경색 설정
        config.image = UIImage(named: "close")
        let button = UIButton(type: .system)
        button.configuration = config
        return button
    }()
    
    // movie title
    let title_label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    // movie image
    let movie_image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // movie description
    let description_label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    // netfilx logo
    let netfilx_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Netflix_icon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // series logo
    let series_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "SERIES")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // year_label
    let year_label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    // tvma image
    let tvma_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "tvma")
        image.contentMode = .scaleAspectFit
        return image
    }()

    // vision image
    let vision_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "vision")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // hd image
    let hd_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "hd")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // ad image
    let ad_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ad")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // play button
    let play_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .white
        if let image = UIImage(named: "Play") {
            let size = CGSize(width: 14, height: 15)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 15
        config.imagePlacement = .leading
        config.baseForegroundColor = .black
        
        var titleAttr = AttributedString.init("Play")
        titleAttr.font = .systemFont(ofSize: 15.0, weight: .semibold)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // download button
    let download_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .darkGray
        if let image = UIImage(named: "Downloads") {
            let size = CGSize(width: 15, height: 15)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 15
        config.imagePlacement = .leading
        config.baseForegroundColor = .lightGray
        
        var titleAttr = AttributedString.init("Download")
        titleAttr.font = .systemFont(ofSize: 15.0, weight: .semibold)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MyList 추가 버튼
    let myList_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        if let image = UIImage(named: "add_icon") {
            let size = CGSize(width: 30, height: 30)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        
        config.imagePadding = 5
        config.imagePlacement = .top
        config.baseForegroundColor = .gray
        
        var titleAttr = AttributedString("My List")
        titleAttr.font = .systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // Rate 버튼
    let rate_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        if let image = UIImage(named: "rate") {
            let size = CGSize(width: 25, height: 25)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 10
        config.imagePlacement = .top
        config.baseForegroundColor = .gray
        
        var titleAttr = AttributedString("Rate")
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
        if let image = UIImage(named: "share2") {
            let size = CGSize(width: 25, height: 25)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 10
        config.imagePlacement = .top
        config.baseForegroundColor = .gray
        
        var titleAttr = AttributedString("Share")
        titleAttr.font = .systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // tab bar image
    let tabbar_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "tabBar")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setUI() {
        // contentView에 모두 추가하기
        contentView.addSubview(movie_image)
        contentView.addSubview(close_button)
        contentView.addSubview(mirror_button)
        contentView.addSubview(title_label)
        contentView.addSubview(netfilx_image)
        contentView.addSubview(series_image)
        contentView.addSubview(year_label)
        contentView.addSubview(tvma_image)
        contentView.addSubview(vision_image)
        contentView.addSubview(hd_image)
        contentView.addSubview(ad_image)
        contentView.addSubview(play_button)
        contentView.addSubview(download_button)
        contentView.addSubview(description_label)
        
        contentView.addSubview(myList_button)
        contentView.addSubview(rate_button)
        contentView.addSubview(share_button)
                
        contentView.addSubview(tabbar_image)
        
        movie_image.translatesAutoresizingMaskIntoConstraints = false
        close_button.translatesAutoresizingMaskIntoConstraints = false
        mirror_button.translatesAutoresizingMaskIntoConstraints = false
        title_label.translatesAutoresizingMaskIntoConstraints = false
        netfilx_image.translatesAutoresizingMaskIntoConstraints = false
        series_image.translatesAutoresizingMaskIntoConstraints = false
        year_label.translatesAutoresizingMaskIntoConstraints = false
        tvma_image.translatesAutoresizingMaskIntoConstraints = false
        vision_image.translatesAutoresizingMaskIntoConstraints = false
        hd_image.translatesAutoresizingMaskIntoConstraints = false
        ad_image.translatesAutoresizingMaskIntoConstraints = false
        play_button.translatesAutoresizingMaskIntoConstraints = false
        description_label.translatesAutoresizingMaskIntoConstraints = false
        myList_button.translatesAutoresizingMaskIntoConstraints = false
        rate_button.translatesAutoresizingMaskIntoConstraints = false
        share_button.translatesAutoresizingMaskIntoConstraints = false
        tabbar_image.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints 설정
        NSLayoutConstraint.activate([
            movie_image.topAnchor.constraint(equalTo: contentView.topAnchor),
            movie_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movie_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movie_image.heightAnchor.constraint(equalToConstant: 230),
            movie_image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            close_button.topAnchor.constraint(equalTo: movie_image.topAnchor, constant: 15),
            close_button.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -42),
            close_button.widthAnchor.constraint(equalToConstant: 32),
            close_button.heightAnchor.constraint(equalToConstant: 32),
            
            mirror_button.topAnchor.constraint(equalTo: movie_image.topAnchor, constant: 15),
            mirror_button.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90),
            mirror_button.widthAnchor.constraint(equalToConstant: 32),
            mirror_button.heightAnchor.constraint(equalToConstant: 32),
            
            netfilx_image.topAnchor.constraint(equalTo: movie_image.bottomAnchor, constant: 5),
            netfilx_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            netfilx_image.heightAnchor.constraint(equalToConstant: 25),
            netfilx_image.widthAnchor.constraint(equalToConstant: 25),
            
            series_image.topAnchor.constraint(equalTo: movie_image.bottomAnchor, constant: 13),
            series_image.leadingAnchor.constraint(equalTo: netfilx_image.trailingAnchor, constant: 0),
            
            title_label.topAnchor.constraint(equalTo: netfilx_image.bottomAnchor, constant: 5),
            title_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            title_label.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            
            year_label.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 10),
            year_label.leadingAnchor.constraint(equalTo: title_label.leadingAnchor),
            
            tvma_image.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 10),
            tvma_image.leadingAnchor.constraint(equalTo: year_label.trailingAnchor, constant: 5),
            
            vision_image.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 10),
            vision_image.leadingAnchor.constraint(equalTo: tvma_image.trailingAnchor, constant: 5),
            
            hd_image.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 10),
            hd_image.leadingAnchor.constraint(equalTo: vision_image.trailingAnchor, constant: 5),
            
            ad_image.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 10),
            ad_image.leadingAnchor.constraint(equalTo: hd_image.trailingAnchor, constant: 5),
            
            play_button.topAnchor.constraint(equalTo: year_label.bottomAnchor, constant: 10),
            play_button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            play_button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            play_button.heightAnchor.constraint(equalToConstant: 40),
            
            download_button.topAnchor.constraint(equalTo: play_button.bottomAnchor, constant: 5),
            download_button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            download_button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            download_button.heightAnchor.constraint(equalToConstant: 40),
            
            description_label.topAnchor.constraint(equalTo: download_button.bottomAnchor, constant: 15),
            description_label.leadingAnchor.constraint(equalTo: title_label.leadingAnchor),
            description_label.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            
            myList_button.topAnchor.constraint(equalTo: description_label.bottomAnchor, constant: 30),
            myList_button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            rate_button.topAnchor.constraint(equalTo: description_label.bottomAnchor, constant: 30),
            rate_button.leadingAnchor.constraint(equalTo: myList_button.trailingAnchor, constant: 60),
            
            share_button.topAnchor.constraint(equalTo: description_label.bottomAnchor, constant: 30),
            share_button.leadingAnchor.constraint(equalTo: rate_button.trailingAnchor, constant: 60),
            
            tabbar_image.topAnchor.constraint(equalTo: myList_button.bottomAnchor, constant: 30),
            tabbar_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            tabbar_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),            
        ])
        
    }
}
