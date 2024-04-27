//
//  FourthViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//  Download Page

import UIKit


class FourthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        // download 큰 이미지
        let image: UIImageView = {
            let image1 = UIImageView()
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(named: "Download-Page-Icon")
            image1.tintColor = .white
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        // label 두개로 나누어 쓰기
        let label1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Movies and TV shows that you"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            return label
        }()
        let label2: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "download appear here."
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            return label
        }()
        
        // "Find Something to Download" button
        let download_button: UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .white
            config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15)
            config.baseForegroundColor = .black
            
            var titleAttr = AttributedString.init("Find Something to Download")
            titleAttr.font = .systemFont(ofSize: 15.0, weight: .semibold)
            config.attributedTitle = titleAttr
            
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        // add components to view
        view.addSubview(image)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(download_button)
        
        // set constraints
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
            label1.topAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label2.topAnchor.constraint(equalTo: label1.safeAreaLayoutGuide.bottomAnchor, constant: 1),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            download_button.topAnchor.constraint(equalTo: label2.safeAreaLayoutGuide.bottomAnchor, constant: 150),
            download_button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            download_button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
