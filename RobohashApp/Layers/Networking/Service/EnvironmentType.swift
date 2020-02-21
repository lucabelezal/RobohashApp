//
//  EnvironmentType.swift
//  Networking
//
//  Created by Lucas Nascimento on 30/06/19.
//  Copyright © 2019 Lucas Nascimento. All rights reserved.
//

import Foundation

public enum EnvironmentType {
    case qa
    case production
    case staging

    public var baseURL: String {
        switch self {
        case .production:
            return "https://robohash.org/"
        case .qa:
            return "https://robohash.org/"
        case .staging:
            return "https://robohash.org/"
        }
    }
}
