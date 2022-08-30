//
//  Connectivity.swift
//  RelaxOnWatch WatchKit Extension
//
//  Created by Minkyeong Ko on 2022/08/10.
//

import WatchConnectivity
import SwiftUI

enum PlayStates: String {
    case play
    case pause
    case backward
    case forward
}

final class Connectivity: NSObject, ObservableObject {
//    @StateObject var playerViewModel = PlayerViewModel()
    @Published var cdInfos: [String] = []
    @Published var cdList: [String] = []
    
    static let shared = Connectivity()

    override init() {
        super.init()
        guard WCSession.isSupported() else {
            return
        }
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
    
    public func sendFromWatch(watchInfo: [String]) {
        guard WCSession.default.activationState == .activated else {
            return
        }
        
        let watchInfo: [String: [String]] = [
            "watchInfo" : watchInfo
        ]
        WCSession.default.transferUserInfo(watchInfo)
    }
}

extension Connectivity: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        let key = "cdInfo"
            guard let CDInfos = userInfo[key] as? [String] else {
            return
        }
        self.cdInfos = CDInfos
        PlayerViewModel.shared.updateCurrentCDName(name: self.cdInfos[1])
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("received application context")
        let key = "cdList"
        guard let CDList = applicationContext[key] as? [String] else {
            return
        }
        self.cdList = CDList
    }
}
