//
//  RobohashCellViewModel.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit.UIImage

protocol RobohashCellViewModelProtocol {
    var image: UIImage { get }
}

struct RobohashCellViewModel: RobohashCellViewModelProtocol {
    
    var image: UIImage
    
    init() {
        self.image = UIImage()
    }
    
    init(image: UIImage) {
        self.image = image
    }
    
}
