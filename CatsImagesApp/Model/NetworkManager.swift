//
//  File.swift
//  CatsPhotosApp
//
//  Created by TarraeRarae on 02.10.2021.
//

import UIKit

class NetworkManager {

	struct Constant {

		static let keyAPI: String = "a02aa90b-4743-4822-a934-85f4d3d74de5"
	}

	weak var delegate: NetworkCatsManagerDelegate?
    private var image: UIImage?

	func getImageWithFilter(_ breed: String) {
		let urlString = "https://api.thecatapi.com/v1/images/search?api_key=\(NetworkManager.Constant.keyAPI)&sub_id=\(UserDefaults.standard.string(forKey: "subID")!)&breed_ids=\(breed)&limit=10&page=1"
		guard let url = URL(string: urlString) else { return }
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url) { (data, _, _) in
			if let data = data {
				if let catsPhotosArray = self.parseJSON(with: data) {
					self.delegate?.updateInterface(with: catsPhotosArray)
				}
			}
		}
		task.resume()
	}

	func parseJSON(with data: Data) -> [CatsPhotosData]? {
		let decoder: JSONDecoder = JSONDecoder()
		do {
			let catsPhotosData = try decoder.decode([CatsPhotosJSONData].self, from: data)
			var catsPhotosArray: [CatsPhotosData] = []
			for item in catsPhotosData {
				guard let catsPhotos = CatsPhotosData(catsPhotosJSONData: item) else { continue }
				catsPhotosArray.append(catsPhotos)
			}
			return catsPhotosArray
		} catch let error as NSError {
			print(String(describing: error))
		}
		return nil
	}
}

extension NetworkManager: CellNetworkManager {

    var imageByURL: UIImage? {
        return self.image
    }

    func getImageByURL(for url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil, let dataActual = data, let image = UIImage(data: dataActual) else { return }
            DispatchQueue.main.sync {
                self.image = image
            }
        }
        task.resume()
    }
}
