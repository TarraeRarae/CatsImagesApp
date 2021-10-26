//
//  TableViewCellViewModelProtocol.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol TableViewCellViewModelProtocol: AnyObject {

    var image: UIImage? { get }
    var cellData: CatsPhotosData? { get }
    var networkManager: CellNetworkManager? { get set }
}
