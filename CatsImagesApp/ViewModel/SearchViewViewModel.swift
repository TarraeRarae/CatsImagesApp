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
    }

    func numberOfRows() -> Int {
        print(searchTableContent.count)
        return searchTableContent.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let cellViewModel =  CatsCellViewModel(for: searchTableContent[indexPath.row])
        cellViewModel.networkManager = self.networkManager
        return cellViewModel
    }

    func refreshData(for breeds: [String]) {
        networkManager.getImageWithFilter(breeds[0])
    }

    func cancelDataTasks() {
        networkManager.cancelAllDataTasks()
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
