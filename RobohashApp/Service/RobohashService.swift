//
//  RobohashService.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 04/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit

protocol RobohashServiceProtocol {
    func loadImage(at index: Int, completion: @escaping (Result<UIImage?>) -> Void)
}

internal class RobohashService: RobohashServiceProtocol {

    var networkManager: NetworkManagerProtocol
    var router: Router<RobohashRouter>
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(environment: EnvironmentType.production)) {
        self.networkManager = networkManager
        self.router = Router<RobohashRouter>()
    }
    
    internal func loadImage(at index: Int, completion: @escaping (Result<UIImage?>) -> Void) {
        
        router.request(.image(index: index)) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkResponse.failed))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.networkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    
                    completion(.success(UIImage(data: responseData)))
                    
                case .failure(let networkFailureError):
                    completion(.failure(networkFailureError))
                }
            }
            
        }
        
    }
}
