//
//  CellNetworkManager.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

protocol CellNetworkManager {

    func getImageByURL(url: URL, handler: @escaping (UIImage) -> Void)
}
