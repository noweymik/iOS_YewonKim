//
//  AddViewController.swift
//  6th_hw_YewonKim
//
//  Created by yewoni on 5/8/24.
//

import UIKit

class AddViewController: UIViewController {
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let partTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "파트를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가하기", for: .normal)
        button.tintColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(nameTextField)
        view.addSubview(partTextField)
        view.addSubview(ageTextField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            partTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            partTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            partTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ageTextField.topAnchor.constraint(equalTo: partTextField.bottomAnchor, constant: 16),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            addButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        addButton.addTarget(self, action: #selector(addMemberTapped), for: .touchUpInside)
    }
    
    // Post request 보내는 함수
    func makePostRequest(_ member: MemberData) {
        guard let url = URL(string: "https://pard-host.onrender.com/pard") else {
            print("🚨 Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(member)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("🚨", error)
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                        DispatchQueue.main.async {
                            self.viewController.getData()
                        }
                    }
                }
            }
            task.resume()
        } catch {
            print("🚨", error)
        }
    }
    
    // 추가하기 버튼을 눌렀을 때 함수
    @objc private func addMemberTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let part = partTextField.text, !part.isEmpty,
              let ageString = ageTextField.text, !ageString.isEmpty,
              let age = Int(ageString) else {
            showAlert(title: "입력 오류", message: "모든 필드를 올바르게 입력해주세요.")
            return
        }
        
        let newMember = MemberData(name: name, part: part, age: age)
        makePostRequest(newMember)
        dismiss(animated: true) // 현재 뷰 컨트롤러를 dimiss(닫기)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
