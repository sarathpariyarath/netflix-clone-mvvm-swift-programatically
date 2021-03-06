//
//  HomeViewController.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

enum Section: Int {
    case TrendingMovies = 0
    case TrendingTV = 1
    case Popular = 2
    case Upcoming = 3
    case Toprated = 4
}
class HomeViewController: UIViewController {
    
    let sectionHeadings: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top Rated"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: "CollectionViewTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
        
        configureNavbar()
        
        homeFeedTable.tableHeaderView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 320))
    
    }
    func configureNavbar() {
        var logoImage = UIImage(named: "netflix-logo")
        logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItems = [ UIBarButtonItem(image: logoImage, style: .plain, target: nil, action: nil),
                                             UIBarButtonItem(title: "   TV SHOWS   ",
                                                                                                style: UIBarButtonItem.Style.plain,
                                                                                                target: nil,
                                                                                                action: nil),
                                              UIBarButtonItem(title: "   MOVIES   ",
                                                                                                 style: UIBarButtonItem.Style.plain,
                                                                                                 target: nil,
                                                                                                 action: nil),
                                              UIBarButtonItem(title: "   MY LIST   ",
                                                                                                 style: UIBarButtonItem.Style.plain,
                                                                                                 target: nil,
                                                                                                 action: nil)
                                             ]
        navigationController?.navigationBar.tintColor = .label
        
    }
     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        
        
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeadings.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTableViewCell", for: indexPath) as! CollectionViewTableViewCell
        
        cell.delegate = self
        
    switch indexPath.section {
    case Section.TrendingMovies.rawValue:
        
        APICaller.shared.getTrendingMovies { result in
            
            switch result {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    case Section.Popular.rawValue:
        
        APICaller.shared.getPopularMovie { result in
            
            switch result {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    case Section.Toprated.rawValue:
        
        APICaller.shared.getToprated { result in
            
            switch result {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    case Section.Upcoming.rawValue:
        
        APICaller.shared.getUpcomingMovie { result in
            
            switch result {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    case Section.TrendingTV.rawValue:
        APICaller.shared.getTrendingTV { result in
            
            switch result {
            case .success(let titles):
                cell.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    default:
        return UITableViewCell()
    }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text
        header.textLabel?.textColor = .label
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffSet = view.safeAreaInsets.top
        let offSets = scrollView.contentOffset.y + defaultOffSet
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSets))
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeadings[section]
    }
}

extension HomeViewController: CollectionViewTableViewDelegate {
    func didTapCollectionViewTableViewCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async {
            let previewViewController = TitlePreviewViewController()
            previewViewController.configure(with: viewModel)
            self.navigationController?.pushViewController(previewViewController, animated: true)
        }
    }
}
