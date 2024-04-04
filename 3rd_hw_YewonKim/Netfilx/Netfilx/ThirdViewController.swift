//
//  ThirdViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit


class ThirdViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setUI()
    }
    
    func setUI(){
        
        let image: UIImageView = {
            let image1 = UIImageView()
            // systemImage의 크기를 조정하기 위해서는 symbolConfiguration을 지정해야 한다.
            let imageSize = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(systemName: "heart.fill", withConfiguration: imageSize)
            image1.tintColor = .white
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        let label1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Coming Soon"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            return label
        }()
        
        view.addSubview(label1)
        view.addSubview(image)
        
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


