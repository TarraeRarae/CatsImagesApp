//
//  SearchViewViewModel.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

class SearchViewViewModel: TableViewViewModelProtocol {

    var searchTableContent: [CatsPhotosData] = []
    var tableView: UITableView?
    var networkManager: NetworkManager = NetworkManager()

    init() {
        networkManager.delegate = self
        refreshData(for: ["beng"])
    }

    func numberOfRows() -> Int {
        return searchTableContent.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let cellViewModel =  CatsCellViewModel(for: searchTableContent[indexPath.row])
        cellViewModel.networkManager = self.networkManager
        return cellViewModel
    }

    func refreshData(for breeds: [String]) {
        networkManager.getImageWithFilter("beng")
    }
}

extension SearchViewViewModel: NetworkCatsManagerDelegate {

    func updateInterface(with catsPhotosArray: [CatsPhotosData]) {
        guard let tableView = tableView else { return }
        self.searchTableContent = catsPhotosArray
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
}
