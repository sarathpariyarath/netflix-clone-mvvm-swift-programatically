//
//  UpComingViewController.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

class UpcomingViewController: UIViewController {

    var titles: [Title] = [Title]()
    let upcomingTable: UITableView = {
        let upcomingTable = UITableView()
        upcomingTable.register(UpcomingTitleTableViewCell.self, forCellReuseIdentifier: "UpcomingTitleTableViewCell")
        return upcomingTable
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        

        view.backgroundColor = .systemBackground
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    func fetchUpcoming() {
        APICaller.shared.getUpcomingMovie {[weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTitleTableViewCell", for: indexPath) as? UpcomingTitleTableViewCell else { return UITableViewCell()}
        cell.configure(with: TitleViewModel(titleName: titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown Title Name", posterURL: titles[indexPath.row].poster_path!))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
