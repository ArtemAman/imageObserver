//
//  MainPresenter.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class MainPresenter {
    
    weak var view: MainViewInput?
    

    private func getRecipesList(requestingString:String){
        
//        MainServices().getRecipesList(query: requestingString) { [weak self] result in
//            switch result {
//            case .success(let succes):
//                let listOfReceips = Parser<RecipeResponse>().parce(data: succes.data)
//                self?.prepareThirdViewModel(listOfReceips: listOfReceips)
//            case .failure(let erorr):
//                print(erorr.localizedDescription)
//            }
//        }
    }
}

// MARK: - Public
extension MainPresenter: MainViewOutput {
    
    func configureDetailRecipeViewController(cellIndex: Int) {
        
    }

    func viewLoaded() {
    
        
    }
    
    
    
}
