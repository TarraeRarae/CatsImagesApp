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
            if self.catImageView.image == nil {
                viewModel.complition = { image in
                    self.catImageView.image = image
                }
                viewModel.getImage()
            }
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
