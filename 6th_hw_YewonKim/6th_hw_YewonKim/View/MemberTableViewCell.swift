//
//  MemberTableViewCell.swift
//  6th_hw_YewonKim
//
//  Created by yewoni on 5/8/24.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MemberTableViewCell")
        contentView.backgroundColor = .clear
        setUI()
    }
    
    var name_label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var part_label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUI() {
        contentView.addSubview(name_label)
        contentView.addSubview(part_label)
        
        NSLayoutConstraint.activate([
            part_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            part_label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            name_label.leadingAnchor.constraint(equalTo: part_label.trailingAnchor, constant: 20),
            name_label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with member: MemberData) {
        part_label.text = "[\(member.part)]"
        name_label.text = member.name
    }
}
