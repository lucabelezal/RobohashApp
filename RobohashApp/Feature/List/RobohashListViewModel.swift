//
//  RobohashListViewModel.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit.UIImage

protocol RobohashListViewModelProtocol {
    var numberOfItems: Int { get }
    var data: (Int) -> RobohashCellViewModelProtocol { get }
}

struct RobohashListViewModel: RobohashListViewModelProtocol {
    
    var numberOfItems: Int
    var data: (Int) -> RobohashCellViewModelProtocol
    
    init() {
        numberOfItems = 5
        data = { _ in return RobohashCellViewModel() }
    }
    
    init(images: [UIImage]) {
        numberOfItems = images.count
        data = { return RobohashCellViewModel(image: images[$0]) }
    }
}
