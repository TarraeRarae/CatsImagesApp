//
//  File.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

class CatsCellViewModel: TableViewCellViewModelProtocol {

    var cellData: CatsPhotosData?
    var networkManager: CellNetworkManager?

    var image: UIImage? {
        guard let cellData = cellData, let networkManager = networkManager else { return nil }
        networkManager.getImageByURL(for: cellData.url)
        return networkManager.imageByURL
    }

    init(for catsPhotosData: CatsPhotosData) {
        cellData = catsPhotosData
    }
}
