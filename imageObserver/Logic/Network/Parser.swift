//
//  Parser.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class Parser<T: Decodable> {
    
    func parce(data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
