//
//  MainViewControllerTableViewCell.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class MainViewControllerTableViewCell: UITableViewCell {
    
    static let reuseId = "MainCell"
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray
        return imageView
    } ()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "ololol"
        label.font = .systemFont(ofSize: 10)
        return label
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        
        addSubview(mainImage)
        addSubview(topLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.topAnchor.constraint(equalTo: topAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 10),
            
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
          ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
