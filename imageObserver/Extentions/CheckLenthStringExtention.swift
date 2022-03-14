//
//  HeightCalculation.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit


extension String {
    
    func checkLenth() -> String {
        let count = self.count
        if count >= 5 {
            let index = self.index(self.startIndex, offsetBy: count - 3)
            let mySubstring = self.prefix(upTo: index)
            return String(mySubstring) + "k"
        } else {
            return self
        }
    }
}
