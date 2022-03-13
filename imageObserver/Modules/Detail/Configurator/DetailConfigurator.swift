//
//  DetailConfigurator.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//

import Foundation


import UIKit

final class DetailConfigurator {

    // MARK: - Internal methods
    func configure(model: CellViewModelProtocol) -> (DetailViewController, DetailPresenter) {
        let view = DetailViewController()
        let presenter = DetailPresenter(model: model)

        presenter.view = view
        view.presenter = presenter

        return (view, presenter)
    }
}
