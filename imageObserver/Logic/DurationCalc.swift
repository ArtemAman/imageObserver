//
//  DurationCalc.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import Foundation



 func calculateTime(block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("Time: \(timeInterval) seconds")
}

