//
//  PatternTableViewCell.swift
//  TableWithoutStoryboard
//
//  Created by Mayya Bykhanova on 30.10.2024.
//

import Foundation
import SnapKit

class PatternTableViewCell: UITableViewCell {
    
    let patternImageView = UIImageView()
    let patternNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        contentView.addSubview(patternImageView)
        contentView.addSubview(patternNameLabel)
        
        patternNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        patternImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        patternImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        patternNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(patternImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
    }
        
        func configure(with pattern: DesignPattern) {
            patternNameLabel.text = pattern.patternName
            patternImageView.image = UIImage(named: pattern.imageName)
        }
    }

