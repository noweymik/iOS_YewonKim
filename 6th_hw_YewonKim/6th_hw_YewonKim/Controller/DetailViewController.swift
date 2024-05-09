//
//  DetailViewController.swift
//  6th_hw_YewonKim
//
//  Created by yewoni on 5/8/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var member: MemberData?
    var viewController: ViewController?
    
    // name label
    private let name_label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // part label
    private let part_label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // age label
    private let age_label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // delete button
    let deleteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonTapped))
        button.tintColor = .red
        return button
    }()
       
    // edit button
    let editButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        deleteButton.target = self
        editButton.target = self
        setupNavigationBar()
        
        setUI()
        configure()
    }
    
    // navigation 아이템 왼쪽에 deleteButton, 오른쪽에 editButton
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = deleteButton
        navigationItem.rightBarButtonItem = editButton
    }
    
    private func setUI() {
        view.addSubview(name_label)
        view.addSubview(part_label)
        view.addSubview(age_label)
        
        NSLayoutConstraint.activate([
            name_label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            name_label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            part_label.topAnchor.constraint(equalTo: name_label.bottomAnchor, constant: 10),
            part_label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            age_label.topAnchor.constraint(equalTo: part_label.bottomAnchor, constant: 10),
            age_label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func configure() {
        guard let member = member else { return }
        name_label.text = member.name
        part_label.text = "Part: \(member.part)"
        age_label.text = "Age: \(member.age)"
    }
    
    private func deleteRequest(_ member: MemberData) {
        guard let id = member.id else { return }
        let urlString = "https://pard-host.onrender.com/pard/\(id)"
        
        guard let url = URL(string: urlString) else {
            print("🚨 Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("🚨🚨 Error : \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("✅ Delete success ")
//                print("✅ Delete success : \(httpResponse)")
                // 다시 getData()로 서버에 있는 데이터 불러오기
                DispatchQueue.main.async {
                    self.viewController?.getData()
                }
            } else {
                print("🚨 Error: No data returned or invalid response")
            }
        }
        task.resume()
    }
    
    // Delete 버튼이 눌렸을 때
    @objc private func deleteButtonTapped() {
        print("Delete button tapped!")
        
        let alertController = UIAlertController(title: "정말로 삭제하시겠습니까?", message: "삭제한 내용은 다시 되돌릴 수 없습니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in

            if let member = self.member {
                self.deleteRequest(member)
            }
            self.dismiss(animated: true)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true)
    }
    
    // Edit 버튼이 눌렸을 때
    @objc private func editButtonTapped() {        
        print("Edit button tapped!")
    }
}
