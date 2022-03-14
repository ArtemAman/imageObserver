//
//  MainViewControllerTableViewCell.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class MainViewControllerTableViewCell: UITableViewCell {
    
    static let reuseId = "MainCell"
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImage: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    } ()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "No username"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var underImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainImage: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        return imageView
    } ()
    
    private lazy var metaLabelWidth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "No Width"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var metaLabelHeight: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "No Height"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var metaLabelSize: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "No Size"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "like")
        return imageView
    } ()
    
    private lazy var commentsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "comment")
        return imageView
    } ()
    
    private lazy var downloadsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "download")
        return imageView
    } ()
    
    private lazy var viewsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "view")
        return imageView
    } ()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var downloadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    override func prepareForReuse() {
        mainImage.set(imageURL: nil)
        avatarImage.set(imageURL: nil)
    }
    
    func fillContent(model: Cell?) {
        
        guard let model = model else { return }
        mainImage.set(imageURL: model.imageUrlString)
        avatarImage.set(imageURL: model.userImageURL)
        
        usernameLabel.text = model.user
        if let width = model.width {
            metaLabelWidth.text = "Image width: \(String(width))"
        }
        
        if let height = model.height {
            metaLabelHeight.text = "Image height: \(String(height))"
        }
        
        if let size = model.imageSize {
            metaLabelSize.text = "Image size: \(String(size))"
        }
        
        let likes = model.likes ?? 0
        let comments = model.comments ?? 0
        let downloads = model.downloads ?? 0
        let views = model.views ?? 0
        
        likeLabel.text = String(likes)
        commentLabel.text = String(comments)
        downloadLabel.text = String(downloads).checkLenth()
        viewLabel.text = String(views).checkLenth()
    }
    
    func setupView() {
        
        selectionStyle = .none
        
        addSubview(topView)
        addSubview(underImageView)
        addSubview(metaLabelWidth)
        addSubview(metaLabelHeight)
        addSubview(metaLabelSize)
        addSubview(bottomView)
        
        topView.addSubview(usernameLabel)
        topView.addSubview(avatarImage)
        underImageView.addSubview(mainImage)
        
        bottomView.addSubview(likesImage)
        bottomView.addSubview(likeLabel)
        bottomView.addSubview(commentsImage)
        bottomView.addSubview(commentLabel)
        bottomView.addSubview(downloadsImage)
        bottomView.addSubview(downloadLabel)
        bottomView.addSubview(viewsImage)
        bottomView.addSubview(viewLabel)
        
        setConstraints()
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            
            
            topView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            topView.heightAnchor.constraint(equalToConstant: 50),
            
            avatarImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            avatarImage.topAnchor.constraint(equalTo: topView.topAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalTo: topView.heightAnchor),
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            underImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            underImageView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            underImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            underImageView.heightAnchor.constraint(equalToConstant: 250),
            
            mainImage.leadingAnchor.constraint(equalTo: underImageView.leadingAnchor),
            mainImage.topAnchor.constraint(equalTo: underImageView.topAnchor),
            mainImage.trailingAnchor.constraint(equalTo: underImageView.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: underImageView.bottomAnchor),
            
            metaLabelWidth.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            metaLabelWidth.topAnchor.constraint(equalTo: underImageView.bottomAnchor, constant: 10),
            metaLabelWidth.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            metaLabelHeight.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            metaLabelHeight.topAnchor.constraint(equalTo: metaLabelWidth.bottomAnchor, constant: 5),
            metaLabelHeight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            metaLabelSize.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            metaLabelSize.topAnchor.constraint(equalTo: metaLabelHeight.bottomAnchor, constant: 5),
            metaLabelSize.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bottomView.heightAnchor.constraint(equalToConstant: 30),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            likesImage.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            likesImage.heightAnchor.constraint(equalToConstant: 15),
            likesImage.widthAnchor.constraint(equalToConstant: 15),
            likesImage.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            likeLabel.leadingAnchor.constraint(equalTo: likesImage.trailingAnchor, constant: 5),
            likeLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            likeLabel.widthAnchor.constraint(equalToConstant: 50),
            
            commentsImage.leadingAnchor.constraint(equalTo: likeLabel.trailingAnchor),
            commentsImage.heightAnchor.constraint(equalToConstant: 15),
            commentsImage.widthAnchor.constraint(equalToConstant: 15),
            commentsImage.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            commentLabel.leadingAnchor.constraint(equalTo: commentsImage.trailingAnchor, constant: 5),
            commentLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            commentLabel.widthAnchor.constraint(equalToConstant: 50),
            
            downloadsImage.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor),
            downloadsImage.heightAnchor.constraint(equalToConstant: 15),
            downloadsImage.widthAnchor.constraint(equalToConstant: 15),
            downloadsImage.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            downloadLabel.leadingAnchor.constraint(equalTo: downloadsImage.trailingAnchor, constant: 5),
            downloadLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            downloadLabel.widthAnchor.constraint(equalToConstant: 50),
            
            viewsImage.leadingAnchor.constraint(equalTo: downloadLabel.trailingAnchor),
            viewsImage.heightAnchor.constraint(equalToConstant: 15),
            viewsImage.widthAnchor.constraint(equalToConstant: 15),
            viewsImage.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            viewLabel.leadingAnchor.constraint(equalTo: viewsImage.trailingAnchor, constant: 5),
            viewLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            viewLabel.widthAnchor.constraint(equalToConstant: 50),
            
          ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImage.layer.cornerRadius = 25
        avatarImage.layer.masksToBounds = true
        
        underImageView.layer.shadowRadius = 3
        underImageView.layer.shadowOpacity = 0.4
        underImageView.layer.shadowOffset = CGSize(width: 1.5, height: 2)
        
        mainImage.layer.cornerRadius = 10
        mainImage.layer.masksToBounds = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
