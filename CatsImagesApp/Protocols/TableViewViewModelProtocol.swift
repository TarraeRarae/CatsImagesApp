//
//  TableViewViewModelProtocol.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol TableViewViewModelProtocol: AnyObject {

    var networkManager: NetworkManager { get }
    var tableView: UITableView? { get set }
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol?
    func refreshData(for breeds: [String])
    func cancelDataTasks()
}
