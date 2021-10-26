//
//  NetworkCatsManagerDelegate.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import Foundation

protocol NetworkCatsManagerDelegate: AnyObject {

    func updateInterface(with catsPhotosArray: [CatsPhotosData])
}
