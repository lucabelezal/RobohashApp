//
//  Robohash.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import Foundation

public struct Robohash {

    public private(set) var url: URL?
    private let order: Int

    public init(url: String?, order: Int) {
        self.url = url?.toURL
        self.order = order
    }
}
