//
//  MainPresenter.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit
import RealmSwift

class MainPresenter {
    
    weak var view: MainViewInput?
    var mainViewModel: MainViewModel?
    private lazy var page: Int = 1
    private var previouseImages: MainViewModel?
    

    private func getImagesFromInternet(page: String){
        
        MainServices().getListOfImages(page: page) { [weak self] result in
            switch result {
            case .success(let succes):
                let listOfImages = Parser<ListOfImagesResponse>().parce(data: succes.data)
                self?.prepareMainModel(listOfImages: listOfImages)
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }
    
    private func prepareMainModel(listOfImages:ListOfImagesResponse?) {
        if  previouseImages != nil {
            previouseImages = MainViewModel(list: listOfImages)
            previouseImages?.cells.forEach({ cell in
                mainViewModel?.cells.append(cell)
                let base = BaseModel(model: cell)
                RealmBase.saveData(base)
            }) 
        } else {
            mainViewModel = MainViewModel(list: listOfImages)
            mainViewModel?.cells.forEach({ cell in
                let base = BaseModel(model: cell)
                RealmBase.saveData(base)
            })
            previouseImages = mainViewModel
        }
        view?.updateTable()
    }
    
    private func getImagesFromDatabase() {
        mainViewModel = MainViewModel(list: nil)
        var items: Results<BaseModel>
        items = realm.objects(BaseModel.self)
        items.forEach { baseModelItem in
            let cell = Cell(baseModelItem: baseModelItem)
            mainViewModel?.cells.append(cell)
        }
        view?.updateTable()
    }
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func configureDetailViewController(cellIndex: Int) {
        let detailModule = DetailConfigurator().configure(model: mainViewModel?.cells[cellIndex] as! CellViewModelProtocol)
        let detailVC = detailModule.0
        view?.presentDetailViewController(viewController: detailVC)
    }
    
    func getNextImages() {
        page += 1
        getImagesFromInternet(page: String(page))
    }
    
    func viewLoaded() {
        if NetworkMonitor.shared.isConnected {
            RealmBase.deleteAll()
            page = 1
            getImagesFromInternet(page: String(page))
        } else {
            getImagesFromDatabase()
        }
    }
}
