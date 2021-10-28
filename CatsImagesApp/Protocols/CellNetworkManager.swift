//
//  CellNetworkManager.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol CellNetworkManager {

    var onComplition: ((UIImage?) -> Void)? { get set }
    func getImageByURL(url: URL)
}
