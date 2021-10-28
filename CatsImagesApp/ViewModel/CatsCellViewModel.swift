//
//  File.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

class CatsCellViewModel: TableViewCellViewModelProtocol {

    var cellData: CatsPhotosData?
    var networkManager: NetworkManagerProtocol?
    var complition: ((UIImage?) -> Void)?

    init(for catsPhotosData: CatsPhotosData) {
        cellData = catsPhotosData
    }

    public func updateImage(image: UIImage?) {
        if let complition = self.complition {
            complition(image)
        }
    }

    public func getImage() {
        guard let cellData = cellData, var networkManager = networkManager else { return }
        networkManager.onComplition = { [weak self] image in
            guard let viewModel = self else { return }
            viewModel.updateImage(image: image)
        }
        networkManager.getImageByURL(url: cellData.url)
    }
}
