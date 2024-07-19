//
//  ViewController3.swift
//  project again
//
//  Created by 김동준 on 7/19/24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController3: UIViewController {
    let viewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }()
    let editImage: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(editImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let textName: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 8.0
        return textView
    }()
    
    let textNumber: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 8.0
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "연락처 추가"
        view.backgroundColor = .white
        view.addSubview(viewImage)
        view.addSubview(editImage)
        view.addSubview(textName)
        view.addSubview(textNumber)
        
        let saveButton = UIBarButtonItem(title: "적용"/* style: .plain, target: self, action: #selector(save)*/)
        self.navigationItem.rightBarButtonItem = saveButton
        
        viewImage.snp.makeConstraints {
            $0.width.height.equalTo(150)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        editImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(viewImage.snp.bottom).offset(20)
        }
        
        textName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(editImage.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(40)
        }
        
        textNumber.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textName.snp.bottom).inset(-10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(40)
        }
    }
    
    @objc private func editImageButtonTapped() {
        makeRandomImage()
    }
    private func makeRandomImage(){
        let imgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Int.random(in: 0...151)).png"
                viewImage.kf.setImage(with: URL(string: imgUrl))
    }
}
