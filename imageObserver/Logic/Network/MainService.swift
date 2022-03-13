//
//  MainService.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import Foundation
import Moya

class MainServices {
    
    let provider = MoyaProvider<MainAPI>()
    
    func getListOfImages(page: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.listOfimages(page: page), completion: completion)
    }
}
