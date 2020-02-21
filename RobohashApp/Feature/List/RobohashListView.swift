//
//  RobohashListView.swift
//  RobohashApp
//
//  Created by Lucas Nascimento on 02/02/20.
//  Copyright © 2020 Lucas Nascimento. All rights reserved.
//

import UIKit

protocol RobohashListViewDelegate: class {
    func loadImage(at indexPath: IndexPath)
    func loadNextImage(at indexPath: IndexPath)
    func cancelLoadImage(at indexPath: IndexPath)
}

class RobohashListView: UIView {
    
    typealias Cell = TableViewCell<RobohashCellView, RobohashCellViewModelProtocol>
    
    let tableView: UITableView
    
    weak var delegate: RobohashListViewDelegate?
    
    var viewModel: RobohashListViewModelProtocol {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView()
        viewModel = RobohashListViewModel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func update() {
        
    }
    
}

extension RobohashListView: ViewCodable {
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 300
        tableView.register(cellType: Cell.self)
    }
    
    func hierarchy() {
        addView(tableView)
    }
    
    func constraints() {
        
        tableView.layout.makeConstraints { make in
            make.top.equalTo(self.layout.safeArea.top)
            make.bottom.equalTo(self.layout.safeArea.bottom)
            make.left.equalTo(self.layout.left)
            make.right.equalTo(self.layout.right)
        }
    }
    
    func styles() {
        backgroundColor = .lightGray
        tableView.backgroundColor = .clear
    }
    
}

// MARK: - TableView Datasource

extension RobohashListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.viewModel = viewModel.data(indexPath.row)
        return cell
    }
}

// MARK: - TableView Delegate

extension RobohashListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.loadImage(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.cancelLoadImage(at: indexPath)
    }
}

// MARK: - TableView Prefetching DataSource

extension RobohashListView: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            delegate?.loadNextImage(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            delegate?.cancelLoadImage(at: indexPath)
        }
    }
}
