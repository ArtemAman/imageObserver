//
//  mainAPI.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import Foundation
import Moya

enum MainAPI {
    case listOfimages(page: String)
}

extension MainAPI: TargetType {
    
    var baseURL: URL {
        return ServerConstants.baseUrl
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .listOfimages(let page):
            return .requestParameters(
                parameters:
                    ["page" : page,
                     "key" : ServerConstants.key,
                     "orientation": ServerConstants.orientation],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
