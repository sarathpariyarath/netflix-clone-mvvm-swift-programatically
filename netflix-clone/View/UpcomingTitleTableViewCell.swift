//
//  UpcomingTitleTableViewCell.swift
//  netflix-clone
//
//  Created by Sarath P on 11/01/22.
//

import UIKit

class UpcomingTitleTableViewCell: UITableViewCell {

    static let identifier = "UpcomingTitleTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titlePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePoster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        applyConstraints()
    }
    
    func applyConstraints() {
        let titlePosterConstraints = [
            titlePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titlePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            titlePoster.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePoster.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: -50)
        ]
        
        let playbuttonConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(titlePosterConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playbuttonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        titlePoster.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    
}
