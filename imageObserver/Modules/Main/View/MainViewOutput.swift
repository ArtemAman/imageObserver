//
//  MainViewOutput.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

protocol MainViewOutput: AnyObject {
    
//    var mainViewModel: ReceipViewModel? { get set }
    
    func viewLoaded()
    func configureDetailRecipeViewController(cellIndex:Int)
    
}
