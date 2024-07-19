//
//  ViewController.swift
//  project again
//
//  Created by 김동준 on 7/17/24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    let tableView = UITableView()
    let Controller2 = ViewController3()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("버튼동작")
        // 테이블 뷰 설정
        view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        
        // 레이블 설정
        //레이블 폰트 설정
        label.font = UIFont.systemFont(ofSize: 30)
        //레이블 텍스트 색상 설정
        label.textColor = .black
        //레이블 텍스트
        label.text = "친구목록"
        tableView.rowHeight = 100
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // 버튼 설정
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.addTarget(self, action: #selector(goToSecondView), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // 레이블 제약 조건 설정
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -145)
        ])
        
        // 버튼 제약 조건 설정
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        // 테이블 뷰 제약 조건 설정
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
      }
    @objc func goToSecondView() {
            self.navigationController?.pushViewController(Controller2, animated: false)
        }
    }
extension  ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6  // <- Cell을 보여줄 갯수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        cell.configureCell(name: "name")
        return cell
    }
}
class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    // UI구성요소
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 하위 뷰 추가
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
    }
    func configureCell(name:String) {
        nameLabel.text = name
        phoneNumberLabel.text = "010-0000-0000"
        
        // 이미지 보기 구성
        profileImageView.backgroundColor = .white
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 0.3
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 25 // 이미지가 직경이 있는 원이라고 가정
        profileImageView.clipsToBounds = true
        
        // 라벨 구성
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        phoneNumberLabel.textColor = .black
        
        // 설정제약
        NSLayoutConstraint.activate([
            // 프로필 이미지 보기 제약
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            // 이름 라벨제약
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
            
            // 전화번호 라벨 재약사항
            phoneNumberLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 60),
            phoneNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
    }
}
