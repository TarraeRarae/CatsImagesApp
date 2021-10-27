//
//  SingleCatPhotoViewController.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 26.10.2021.
//

import UIKit

class SingleCatPhotoViewController: UIViewController {

    private var catImageView: UIImageView = UIImageView()
    private var cellData: CatsPhotosData?

    override func viewDidLoad() {
        view.backgroundColor = .white
        view.backgroundColor = .white
        if let cellData = cellData {
            navigationItem.title = cellData.name
        }
        setupCatImageView()
    }

    init(cellViewModel: TableViewCellViewModelProtocol?) {
        if let cellViewModel = cellViewModel, let data = cellViewModel.cellData {
            self.cellData = data
        } else {
            cellData = nil
        }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCatImageView() {
        guard let cellData = cellData else { return }
        let task = URLSession.shared.dataTask(with: cellData.url) { (data, _, error) in
            guard error == nil,
                        let dataActual = data,
                        let image = UIImage(data: dataActual)
            else {
                    return
            }
            DispatchQueue.main.async {
                self.catImageView.image = image
            }
        }
        task.resume()
        self.view.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            catImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            catImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
            catImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1)
        ])
    }
}
