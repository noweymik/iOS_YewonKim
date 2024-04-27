//
//  EpisodeTableViewCell.swift
//  Netfilx
//
//  Created by yewoni on 4/14/24.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "EpisodeTableViewCell")
        contentView.backgroundColor = UIColor.black
        setUI()
    }
    
    // episode image
    let episode_image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // episode title
    let episode_title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    // episode runtime
    let episode_runtime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.text = "37m"
        return label
    }()
    
    // episode description
    let episode_description: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    func setUI() {
        contentView.addSubview(episode_image)
        contentView.addSubview(episode_title)
        contentView.addSubview(episode_runtime)
        contentView.addSubview(episode_description)
        
        episode_image.translatesAutoresizingMaskIntoConstraints = false
        episode_title.translatesAutoresizingMaskIntoConstraints = false
        episode_runtime.translatesAutoresizingMaskIntoConstraints = false
        episode_description.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episode_image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            episode_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            episode_image.heightAnchor.constraint(equalToConstant: 80),
            episode_image.widthAnchor.constraint(equalToConstant: 160),
            
            episode_title.topAnchor.constraint(equalTo: episode_image.topAnchor, constant: 28),
            episode_title.leadingAnchor.constraint(equalTo: episode_image.trailingAnchor, constant: 5),
            
            episode_runtime.topAnchor.constraint(equalTo: episode_title.bottomAnchor, constant: 2),
            episode_runtime.leadingAnchor.constraint(equalTo: episode_title.leadingAnchor),
            
            episode_description.topAnchor.constraint(equalTo: episode_image.bottomAnchor, constant: 10),
            episode_description.leadingAnchor.constraint(equalTo: episode_image.leadingAnchor, constant: 7),
            episode_description.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        
        ])
    }
    
    
}
