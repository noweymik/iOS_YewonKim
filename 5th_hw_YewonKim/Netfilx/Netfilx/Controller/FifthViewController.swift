//
//  FifthViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit


class FifthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setUI()
    }
    
    func setUI(){
        let label1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "More Page"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            return label
        }()
        
        view.addSubview(label1)

        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}
