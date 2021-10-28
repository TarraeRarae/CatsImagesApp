//
//  SingleCatPhotoViewController.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 26.10.2021.
//

import UIKit

class SingleCatPhotoViewController: UIViewController {

    public var network: NetworkManagerProtocol?
    private var singleCatPhotoView: SingleCatPhotoView?
    private var cellData: CatsPhotosData? {
        didSet {
            guard let cellData = cellData else { return }
            navigationItem.title = cellData.name
        }
    }

    init(cellViewModel: TableViewCellViewModelProtocol?, networkManager: NetworkManagerProtocol?) {
        if let cellViewModel = cellViewModel, let data = cellViewModel.cellData, let networkManager = networkManager {
            self.cellData = data
            self.network = networkManager
        }
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
        guard let cellData = cellData  else { return }
        navigationItem.title = cellData.name
        getImage()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let singleCatPhotoView = singleCatPhotoView {
            singleCatPhotoView.updateScrollViewContentSize()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getImage() {
        guard var network = network, let cellData = cellData else { return }
        network.onComplition = { [weak self] image in
            if let controller = self {
                controller.setupView(image: image)
            }
        }
        network.getImageByURL(url: cellData.url)
    }

    func setupView(image: UIImage?) {
        guard let cellData = cellData else { return }
        let multiplier = CGFloat(cellData.height) / CGFloat(cellData.width)
        singleCatPhotoView = SingleCatPhotoView(frame: self.view.frame, image: image, multiplier: multiplier, breed: cellData.breed)
        if let singleCatPhotoView = singleCatPhotoView {
            self.view.addSubview(singleCatPhotoView)
        }
    }
}
