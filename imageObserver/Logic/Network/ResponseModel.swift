//
//  ResponseModel.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

struct ListOfImagesResponse: Decodable {
    
    var total:Int?
    var totalHits:Int?
    var hits: [Hit]?
}

struct Hit: Decodable {

    var id:Int?
    var webformatURL: String?
    var webformatWidth: Int?
    var webformatHeight: Int?
    var imageSize: Int?
    var views: Int?
    var downloads: Int?
    var likes: Int?
    var comments: Int?
    var user: String?
    var userImageURL: String?
}
