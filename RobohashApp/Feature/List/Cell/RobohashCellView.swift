//
//  RobohashCellView.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit

class RobohashCellView: UIView, ViewModelOwner {
    
    private var contentView: CardView
    private var imageView: UIImageView
    
    var isSelected: Bool
    
    var viewModel: RobohashCellViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        self.contentView = CardView()
        self.imageView = UIImageView()
        self.isSelected = false
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        let model = viewModel.unsafelyUnwrapped
        imageView.image = model.image
    }
}

extension RobohashCellView: ViewCodable {
    
    func configure() {}
    
    func hierarchy() {
        contentView.addView(imageView)
        addView(contentView)
    }
    
    func constraints() {
        contentView.layout.makeConstraints { make in
            make.top.equalTo(self.layout.top, constant: 16)
            make.bottom.equalTo(self.layout.bottom, constant: -16)
            make.left.equalTo(self.layout.left, constant: 16)
            make.right.equalTo(self.layout.right, constant: -16)
        }
        
        imageView.layout.makeConstraints { make in
            make.top.equalTo(contentView.layout.top)
            make.bottom.equalTo(contentView.layout.bottom)
            make.left.equalTo(contentView.layout.left)
            make.right.equalTo(contentView.layout.right)
        }
    }
    
    func styles() {
        contentView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
}
