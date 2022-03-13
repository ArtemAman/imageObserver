//
//  FooterView.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//

import UIKit

class FooterView: UIView {
    
    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
        addSubview(loader)
        makeContrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func makeContrainsts() {
        
        NSLayoutConstraint.activate([
            
            loader.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            loader.centerXAnchor.constraint(equalTo: centerXAnchor)
                        
        ])
    }
    
    func showLoader() {
        loader.startAnimating()
    }
}

