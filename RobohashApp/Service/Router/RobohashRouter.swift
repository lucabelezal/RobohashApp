//
//  RobohashRouter.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 21/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import Foundation

public enum RobohashRouter {
    case image(index: Int)
}

extension RobohashRouter: EndpointType {

    public var baseURL: URL {
        guard let base = NetworkManager.baseURL, let url = URL(string: base) else {
                fatalError("baseURL could not be configured.")
        }
        return url
    }

    public var path: String {
        switch self {
        case .image(let index):
            return "\(index).png"
        }
    }

    public var httpMethod: HTTPMethod {
        return .get
    }

    public var task: HTTPTask {
        return .request
    }

    public var headers: HTTPHeaders? {
        return nil
    }
}
