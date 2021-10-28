//
//  SingleCatPhotoView.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 28.10.2021.
//

import UIKit

class SingleCatPhotoView: UIView {

    private var favoriteButton = UIButton()
    private var breedLabel = UILabel()
    var scrollView: UIScrollView = UIScrollView(frame: UIScreen.main.bounds)
    var catImageView = UIImageView()

    init(frame: CGRect, image: UIImage?, multiplier: CGFloat, breed: String) {
        super.init(frame: frame)
        self.frame = frame
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupScrollView()
        if let image = image {
            setupImageView(multiplier: multiplier, image: image)
        }
        setupFavoriteButton()
        setupBreedLabel(breed: breed)
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
        catImageView.contentMode = .scaleAspectFit
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

    private func setupFavoriteButton() {
        favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        favoriteButton.contentHorizontalAlignment = .fill
        favoriteButton.contentVerticalAlignment = .fill
        favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.addSubview(favoriteButton)
        scrollView.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20),
            favoriteButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 42),
            favoriteButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.15)
        ])
        var screenSizeMultiplier: CGFloat = 0
        let screenSize = round(Double(UIScreen.main.bounds.height) / Double(UIScreen.main.bounds.width), toNearest: 0.01)
        let maxSize = round(16.0 / 9.0, toNearest: 0.01)
        if  maxSize == screenSize {
            screenSizeMultiplier = 0.06
        } else {
            screenSizeMultiplier = 0.05
        }
        favoriteButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: screenSizeMultiplier).isActive = true
    }

    private func setupBreedLabel(breed: String) {
        breedLabel.text = "Breed:\n- \(breed)"
        breedLabel.numberOfLines = 0
        breedLabel.textAlignment = .left
        breedLabel.font = UIFont(name: "Times New Roman", size: 30)
        scrollView.addSubview(breedLabel)
        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 10),
            breedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 42),
            breedLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3),
            breedLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8)
        ])
    }

    public func updateScrollViewContentSize() {
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: breedLabel.frame.maxY)
    }
}

extension SingleCatPhotoView {
    func round(_ value: Double, toNearest: Double) -> Double {
        return UIKit.round(value / toNearest) * toNearest
    }
}
