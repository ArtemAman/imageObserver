//
//  MainViewOutput.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

protocol MainViewOutput: AnyObject {
    
    var mainViewModel: MainViewModel? { get set }
    
    func viewLoaded()
    func getNextImages()
    func configureDetailViewController(cellIndex:Int)
    
}
