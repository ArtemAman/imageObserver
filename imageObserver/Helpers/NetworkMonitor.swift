//
//  NetworkMonitor.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//

import Network

final class NetworkMonitor {

    static let shared = NetworkMonitor()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public var isConnected: Bool = false

    init() {
        monitor = NWPathMonitor()
    }

    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
}


