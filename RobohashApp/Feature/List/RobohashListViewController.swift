//
//  RobohashListViewController.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit

class RobohashListViewController: UIViewController {
        
    private var images: [IndexPath: ImageLoadOperation] {
        didSet {
            updateView()
        }
    }
    
    private var service: RobohashService
    
    init() {
        images = [IndexPath: ImageLoadOperation]()
        service = RobohashService()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = RobohashListView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Private Metthods
    
    private func configureView() {
        title = "Robohash list"
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
            
    private func updateView() {
        if let theView = view as? RobohashListView {
            theView.delegate = self
            theView.viewModel = RobohashListViewModel(images: [])
        }
    }
}

extension RobohashListViewController: RobohashListViewDelegate {
    
    func loadImage(at indexPath: IndexPath) {
        
    }
    
    func loadNextImage(at indexPath: IndexPath) {
                
    }
    
    func cancelLoadImage(at indexPath: IndexPath) {
        
    }
}
