//
//  ImageLoadOperation.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 04/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit.UIImage

internal class ImageLoadOperation: Operation {
    
    internal var updateViewModel: ((UIImage?) -> Void)?
    internal private(set) var image: UIImage?
    
    private var service: RobohashServiceProtocol
    
    internal init(service: RobohashServiceProtocol) {
        self.service = service
    }
    
    override func main() {
        
        if isCancelled {
            return
        }
        
        //        guard let url = robohash.url else {
        //            return
        //        }
        
        service.loadImage(at: 0) { result in
            
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let image):
                    self?.image = image
                    self?.updateViewModel?(image)
                case .failure:
                    break
                }
                
            }
            
        }
        
        //        downloadImageFrom(url) { (image) in
        //            DispatchQueue.main.async { [weak self] in
        //                self?.image = image
        //                self?.updateViewModel?(image)
        //            }
        //        }
    }
    
    //    private func downloadImageFrom(_ url: URL, completionHandler: @escaping (UIImage?) -> Void) {
    //
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
    //                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
    //                let data = data, error == nil,
    //                let image = UIImage(data: data)
    //                else { return }
    //            completionHandler(image)
    //        }.resume()
    //    }
}
