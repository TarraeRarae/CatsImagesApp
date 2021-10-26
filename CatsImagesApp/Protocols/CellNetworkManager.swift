//
//  CellNetworkManager.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol CellNetworkManager {

    var imageByURL: UIImage? { get }
    func getImageByURL(for url: URL)
}
