//
//  ImageService.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 21/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit

protocol ImageServiceProtocol {
    associatedtype ViewModel
    func loadData(at indexPath: IndexPath, for viewModel: ViewModel)
    func loadImage(at indexPath: IndexPath, isUpdated: Bool, completion: ((ImageLoadOperation) -> Void)?)
    func cancelLoadData(at indexPath: IndexPath)
    func update(_ viewModel: ViewModel, with image: UIImage?, at indexPath: IndexPath)
}

class ImageService<ViewModel>: ImageServiceProtocol {
    
    private lazy var operationQueue = OperationQueue()
    private lazy var images = [IndexPath: ImageLoadOperation]()
    private lazy var service = RobohashService()
        
    func loadData(at indexPath: IndexPath, for viewModel: ViewModel) {
        
        let updateViewModel: (UIImage?) -> Void = { [weak self] image in
            self?.update(viewModel, with: image, at: indexPath)
        }

        loadImage(at: indexPath, isUpdated: true) { data in
            data.updateViewModel = updateViewModel
        }
        
    }
    
    func cancelLoadData(at indexPath: IndexPath) {
        if let data = images[indexPath] {
            data.cancel()
            images.removeValue(forKey: indexPath)
        }
    }
    
    func loadImage(at indexPath: IndexPath, isUpdated: Bool, completion: ((ImageLoadOperation) -> Void)?) {
//        if let data = service.loadImage(at: indexPath.row) {
//            operationQueue.addOperation(data)
//            images[indexPath] = data
//
//            if isUpdated {
//                completion?(data)
//            }
//        }
    }
        
    func update(_ viewModel: ViewModel, with image: UIImage?, at indexPath: IndexPath) {
        //cell.configureCell(with: image)
        images.removeValue(forKey: indexPath)
    }
    
}
