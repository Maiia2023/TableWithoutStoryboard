//
//  DetailPatternViewController.swift
//  
//
//  Created by Mayya Bykhanova on 01.11.2024.
//

import Foundation
import SnapKit
import UIKit

class DetailPatternViewController: UIViewController {
    
    private let patternImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    fileprivate var pattern: DesignPattern?
    
    init(pattern: DesignPattern) {
        self.pattern = pattern
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupScrollView()
        setupContentView()
        setupPatternImageView()
        setupDescriptionLabel()
        
        setupImageTapGesture()
        
    }
    
    private func setupImageTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        patternImageView.isUserInteractionEnabled = true
        patternImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        let photoViewController = PhotoViewController()
        navigationController?.pushViewController(photoViewController, animated: true)
    }
    
    func configure(with pattern: DesignPattern) {
        patternImageView.image = UIImage(named: pattern.imageName)
        descriptionLabel.text = pattern.description
    }
}

extension DetailPatternViewController {
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension DetailPatternViewController {
    func setupPatternImageView() {
        contentView.addSubview(patternImageView)
        patternImageView.image = UIImage(named: pattern!.imageName)
        patternImageView.contentMode = .scaleAspectFit
        patternImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(250)
        }
    }
}

extension DetailPatternViewController {
    func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = pattern?.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(patternImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}


        
//        if let pattern = pattern {
//            navigationItem.title = pattern.patternName
//            imageName.image = UIImage(named: pattern.imageName)
//            patternDescription.text = pattern.description
//    
//        }
//        
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_ :))) {
//        imageName.UIUserInteractionEnabled = true
//        imageName.addGestureRecognizer(tapGesture)
//    }

