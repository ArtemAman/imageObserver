//
//  HeightCalculation.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit


extension String {
    func height(with width: CGFloat, font: UIFont) -> CGFloat {
        return (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).height
    }
    
    func width(with height: CGFloat, font: UIFont) -> CGFloat {
        return (self as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude,height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).width
    }
}
