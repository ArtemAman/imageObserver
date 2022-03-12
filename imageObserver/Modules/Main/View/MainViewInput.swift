//
//  MainViewInput.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

protocol MainViewInput: AnyObject {
    func updateTable()
    func presentDetailViewController(viewController:UIViewController)
}
