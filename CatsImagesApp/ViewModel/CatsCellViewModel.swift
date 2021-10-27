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
    private var storedImage: UIImage?

    var image: UIImage? {
        if let cellData = cellData {
            networkManager?.getImageByURL(url: cellData.url) { image in
                    print(image.size.width)
            }
        }
        return storedImage
    }

    init(for catsPhotosData: CatsPhotosData) {
        cellData = catsPhotosData
    }
}
