//
//  NetworkConnectivity.swift
//  TNTCustomer
//
//  Created by MacBook Pro on 25/06/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Network
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
