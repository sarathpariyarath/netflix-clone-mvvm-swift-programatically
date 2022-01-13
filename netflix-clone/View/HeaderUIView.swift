//
//  HeaderUIView.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

class HeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        let downloadButton = UIButton()
        downloadButton.setTitle("  Play", for: .normal)
        downloadButton.setTitleColor(.systemBackground, for: .normal)
        downloadButton.setImage(UIImage(systemName: "play.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        downloadButton.backgroundColor = UIColor.white
        downloadButton.layer.borderWidth = 1
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.layer.cornerRadius = 5
        return downloadButton
    }()
    
    private let playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle(" My List", for: .normal)
        playButton.setImage(UIImage(systemName: "plus"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    private let infoButton: UIButton = {
        let infoButton = UIButton()
        infoButton.setTitle(" Info", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle")?.withRenderingMode(.alwaysOriginal), for: .normal)
        infoButton.tintColor = .systemBackground
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        return infoButton
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "strangerthings")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        addSubview(infoButton)
        applyConstraints()
        
    }
    func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            playButton.widthAnchor.constraint(equalToConstant: 115)
        ]
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 85),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            downloadButton.widthAnchor.constraint(equalToConstant: 80),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let infoButtonConstraints = [
            infoButton.trailingAnchor.constraint(equalTo: downloadButton.trailingAnchor, constant: 110),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            infoButton.widthAnchor.constraint(equalToConstant: 115)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(infoButtonConstraints)
    }
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
