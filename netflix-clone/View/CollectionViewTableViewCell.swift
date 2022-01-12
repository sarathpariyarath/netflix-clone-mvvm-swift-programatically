//
//  CollectionViewTableViewCell.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

protocol CollectionViewTableViewDelegate: AnyObject {
    func didTapCollectionViewTableViewCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
}

class CollectionViewTableViewCell: UITableViewCell {

    var delegate: CollectionViewTableViewDelegate?
    
  static let identifier = "CollectionViewTableViewCell"
    private var titles: [Title] = [Title]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    public func configure(with titles : [Title]) {
        self.titles = titles
            DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
//        print(titles)
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
            }
        
        guard let model = titles[indexPath.row].poster_path else {
            
            return UICollectionViewCell()
            
        }
//        print(model)
        cell.configure(with: model)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        guard let titleName = title.original_name ?? title.original_title else { return }
        APICaller.shared.getMovie(with: ("\(titleName) + trailer")) { result in
            switch result {
            case .success(let videoElement):
                guard let titleOverview = self.titles[indexPath.row].overview else { return }
                let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverView: titleOverview)
                self.delegate?.didTapCollectionViewTableViewCell(self, viewModel: viewModel )
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
