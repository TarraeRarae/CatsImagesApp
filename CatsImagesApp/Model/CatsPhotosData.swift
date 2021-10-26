//
//  CatsPhotos.swift
//  CatsPhotosApp
//
//  Created by TarraeRarae on 02.10.2021.
//

import Foundation

struct CatsPhotosData {

	let url: URL
	let name: String
	let breed: String
	let width: Int
	let height: Int

	init?(catsPhotosJSONData: CatsPhotosJSONData) {
		self.url = catsPhotosJSONData.url
		self.name = catsPhotosJSONData.id
		self.breed = catsPhotosJSONData.breeds[0].name
		self.width = catsPhotosJSONData.width
		self.height = catsPhotosJSONData.height
	}
}
