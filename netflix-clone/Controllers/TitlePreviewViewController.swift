//
//  TitlePreviewViewController.swift
//  netflix-clone
//
//  Created by Sarath P on 12/01/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {

    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.text = "Hey"
        return label
    }()
    
    let overViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Harry is the best moview ever as to watch as a kid."
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .label
        button.tintColor = .systemBackground
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("Play", for: .normal)
        return button
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrow.down.circle")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Download", for: .normal)
        button.tintColor = .label
        return button
    }()
    
    
    
    let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(labelTitle)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)
        view.addSubview(playButton)
        
        configureConstraints()
        
    }
    

    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 350)
        ]
        
        let titleLabelConstraints = [
            labelTitle.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let playButtonConstraints = [
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 20),
            playButton.widthAnchor.constraint(equalToConstant: 300),
            playButton.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10),
            downloadButton.widthAnchor.constraint(equalToConstant: 300),
            downloadButton.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)
        
    }

    func configure(with model: TitlePreviewViewModel) {
        labelTitle.text = model.title
        overViewLabel.text = model.titleOverView
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        
        webView.load(URLRequest(url: url))
    }
}
