//
//  DownloadsViewController.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    let downloadsLabels: UILabel = {
        let label = UILabel()
        label.text = "You have no downloads"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(downloadsLabels)
        
        configureConstraints()
    }
    

    func configureConstraints() {
        let downloadLabelConstraints = [
            downloadsLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadsLabels.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(downloadLabelConstraints)
    }

}
