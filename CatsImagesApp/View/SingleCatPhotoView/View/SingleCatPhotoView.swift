//
//  SingleCatPhotoView.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 28.10.2021.
//

import UIKit

class SingleCatPhotoView: UIView {

    private var scrollView: UIScrollView = UIScrollView(frame: UIScreen.main.bounds)

    var catImageView = UIImageView()

    init(frame: CGRect, image: UIImage?, multiplier: CGFloat) {
        super.init(frame: frame)
        self.frame = frame
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupScrollView()
        if let image = image {
            setupImageView(multiplier: multiplier, image: image)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupScrollView() {
        scrollView.alwaysBounceVertical = true
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(scrollView)
    }

    private func setupImageView(multiplier: CGFloat, image: UIImage) {
        catImageView.image = image
        scrollView.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            catImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            catImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            catImageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: multiplier)
        ])
    }
}
