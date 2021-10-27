//
//  TableCellImageController.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

class CatsTableViewCellController: UITableViewCell {

    struct Constant {

        static let nibName = "CatsTableViewCell"
        static let cellID = "CatsTableViewCell"
        static let rowHeight: CGFloat = 300.0
    }

    @IBOutlet private var catImageView: UIImageView!

    var viewModel: TableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            if catImageView?.image == nil {
                catImageView?.image = viewModel.image
            }
//            let task = URLSession.shared.dataTask(with: viewModel.cellData!.url) { (data, _, error) in
//                guard error == nil,
//                            let dataActual = data,
//                            let image = UIImage(data: dataActual)
//                else {
//                        return
//                }
//                DispatchQueue.main.async {
//                    self.catImageView.image = image
//                }
//            }
//            task.resume()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        catImageView?.backgroundColor = .clear
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        catImageView?.image = nil
    }
}
