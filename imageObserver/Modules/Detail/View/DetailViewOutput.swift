//
//  DetailOutput.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//

import UIKit
protocol DetailViewOutput: AnyObject {
    var detailViewModel: CellViewModelProtocol? { get set}

    func viewLoaded()
}

