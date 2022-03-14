//
//  DetailViewController.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//


import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewOutput?
    var detailModel: CellViewModelProtocol?
    var newHeight: CGFloat?
    
    private lazy var underImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()

    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        setupView()

    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(underImageView)
        view.addSubview(dateLabel)
        
        underImageView.addSubview(imageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
    
            
            underImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            underImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            underImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            underImageView.heightAnchor.constraint(equalToConstant: newHeight ?? 250),
            
            imageView.leadingAnchor.constraint(equalTo: underImageView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: underImageView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: underImageView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: underImageView.bottomAnchor),
            
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            dateLabel.topAnchor.constraint(equalTo: underImageView.bottomAnchor, constant: 10),
            

        ])
    }
}

extension DetailViewController: DetailViewInput {

    func setupInfo() {
        detailModel = self.presenter?.detailViewModel
        guard let model = detailModel else { return }
        imageView.set(imageURL: model.imageUrlString)
        dateLabel.text = "Dowloaded: \(model.date!)"
        newHeight = (CGFloat(model.height!) * UIScreen.main.bounds.width) / CGFloat(model.width!)
    }
}
