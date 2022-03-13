//
//  MainModel.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit
import RealmSwift

protocol CellViewModelProtocol {
    
    var imageUrlString: String? { get }
    var width: Int? { get }
    var height: Int? { get }
    var date: String? { get }
    var imageSize: Int? { get }
    var views: Int? { get }
    var downloads: Int? { get }
    var likes: Int? { get }
    var comments: Int? { get }
    var user: String? { get }
    var userImageURL: String? { get }
    
}

struct Cell: CellViewModelProtocol {

    var imageUrlString: String?
    var width: Int?
    var height: Int?
    var date: String?
    var imageSize: Int?
    var views: Int?
    var downloads: Int?
    var likes: Int?
    var comments: Int?
    var user: String?
    var userImageURL: String?
    
    init(hit: Hit?) {
        
        imageUrlString = hit?.webformatURL
        width = hit?.webformatWidth
        height = hit?.webformatHeight
        date = getDate()
        imageSize = hit?.imageSize
        views = hit?.views
        downloads = hit?.downloads
        likes = hit?.likes
        comments = hit?.comments
        user = hit?.user
        userImageURL = hit?.userImageURL
                
    }
    
    init(baseModelItem: BaseModel) {
        
        imageUrlString = baseModelItem.imageUrlString
        width = baseModelItem.width
        height = baseModelItem.height
        date = baseModelItem.date
        imageSize = baseModelItem.imageSize
        views = baseModelItem.views
        downloads = baseModelItem.downloads
        likes = baseModelItem.likes
        comments = baseModelItem.comments
        user = baseModelItem.user
        userImageURL = baseModelItem.userImageURL
                
    }
    
    private func getDate() -> String? {
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateStyle = .long
        let dateString = formatter.string(from: currentDateTime)
        return dateString
    }
}

struct MainViewModel {
    
    var cells: [Cell] = []
    
    init(list: ListOfImagesResponse?) {
        list?.hits?.forEach({ hit in
            cells.append(Cell(hit: hit))
        })
    }
}


class BaseModel: Object {
    
    @objc dynamic var imageUrlString: String = ""
    @objc dynamic var width: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var date: String = ""
    @objc dynamic var imageSize: Int = 0
    @objc dynamic var views: Int = 0
    @objc dynamic var downloads: Int = 0
    @objc dynamic var likes: Int = 0
    @objc dynamic var comments: Int = 0
    @objc dynamic var user: String = ""
    @objc dynamic var userImageURL: String = ""
    
    convenience init(model: CellViewModelProtocol) {
        self.init()
        self.imageUrlString = model.imageUrlString ?? ""
        self.width = model.width ?? 0
        self.height = model.height ?? 0
        self.date = model.date ?? ""
        self.imageSize = model.imageSize ?? 0
        self.views = model.views ?? 0
        self.downloads = model.downloads ?? 0
        self.likes = model.likes ?? 0
        self.comments = model.comments ?? 0
        self.user = model.user ?? ""
        self.userImageURL = model.userImageURL ?? ""
            
    }

}

