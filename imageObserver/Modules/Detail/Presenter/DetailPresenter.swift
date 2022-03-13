//
//  DetailPresenter.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//


import UIKit

class DetailPresenter {
    
    weak var view: DetailViewInput?
    var detailViewModel: CellViewModelProtocol?
    
    init(model:CellViewModelProtocol?) {
        self.detailViewModel = model
    }
}


extension DetailPresenter: DetailViewOutput {
    
    func viewLoaded() {
        guard detailViewModel != nil else { return }
        view?.setupInfo()
    }
}
