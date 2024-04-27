//
//  HomeTableViewCell.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "HomeTableViewCell")
        
        contentView.addSubview(thumbnail_image)
        contentView.addSubview(netfilx_image)
        contentView.addSubview(topbutton1)
        contentView.addSubview(topbutton2)
        contentView.addSubview(topbutton3)
                
        contentView.addSubview(myList_button)
        contentView.addSubview(play_button)
        contentView.addSubview(info_button)
        setConstraints()
    }
    
    // 큰 썸네일 영화이미지
    let thumbnail_image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "1movie")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // 넷플릭스 로고
    let netfilx_image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Netflix_icon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // 상단 버튼1
    let topbutton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TV Shows", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    // 상단 버튼2
    let topbutton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Movies", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    // 상단 버튼3
    let topbutton3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("My List", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        return button
    }()

    // MyList 추가 버튼
    let myList_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.image = UIImage(named: "Add")
        config.imagePlacement = .top
        config.baseForegroundColor = .white
        
        var titleAttr = AttributedString.init("My List")
        titleAttr.font = .systemFont(ofSize: 14.0, weight: .regular)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // Play 버튼
    let play_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        config.image = UIImage(named: "Play")
        config.imagePadding = 20
        config.imagePlacement = .leading
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15)
        config.baseForegroundColor = .black
        
        var titleAttr = AttributedString.init("Play")
        titleAttr.font = .systemFont(ofSize: 20.0, weight: .semibold)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // Info 버튼
    let info_button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.image = UIImage(named: "Info")
        config.imagePadding = 1
        config.titlePadding = 0
        config.imagePlacement = .top
        config.baseForegroundColor = .white
        
        var titleAttr = AttributedString.init("Info")
        titleAttr.font = .systemFont(ofSize: 14.0, weight: .regular)
        config.attributedTitle = titleAttr
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            thumbnail_image.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnail_image.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            thumbnail_image.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            thumbnail_image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            thumbnail_image.heightAnchor.constraint(equalToConstant: 580),
            
            netfilx_image.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            netfilx_image.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
                        
            topbutton1.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            topbutton1.leadingAnchor.constraint(equalTo: netfilx_image.safeAreaLayoutGuide.trailingAnchor, constant: 30),
            
            topbutton2.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            topbutton2.leadingAnchor.constraint(equalTo: topbutton1.safeAreaLayoutGuide.trailingAnchor, constant: 30),
            
            topbutton3.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            topbutton3.leadingAnchor.constraint(equalTo: topbutton2.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            
                    
            myList_button.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 400),
            myList_button.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            play_button.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 405),
            play_button.leadingAnchor.constraint(equalTo: myList_button.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            
            info_button.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 400),
            info_button.leadingAnchor.constraint(equalTo: play_button.safeAreaLayoutGuide.trailingAnchor, constant: 40),
        ])
    }        
}
