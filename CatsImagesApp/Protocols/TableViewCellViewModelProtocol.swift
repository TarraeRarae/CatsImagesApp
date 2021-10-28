//
//  TableViewCellViewModelProtocol.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol TableViewCellViewModelProtocol: AnyObject {

    var cellData: CatsPhotosData? { get }
    var networkManager: NetworkManagerProtocol? { get set }
    var complition: ((UIImage?) -> Void)? { get set }
    func getImage()
}
