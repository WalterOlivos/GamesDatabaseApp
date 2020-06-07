//
//  GamesListViewController.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class GamesListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    private var isLoading: Bool = false {
        didSet {
            if isLoading {
                loadIndicator.startAnimating()
                tableView.isHidden = true
            } else {
                loadIndicator.stopAnimating()
                tableView.isHidden = false
            }
        }
    }
    
    private var viewModel = GamesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchGames()
        isLoading = true
        
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        viewModel.fetchGames()
//        isLoading = true
//    }
    
}

extension GamesListViewController: GamesListViewModelDelegate {
    func gamesListViewModelDidGetGames() {
        isLoading = false
        tableView.reloadData()
        tableView.tableFooterView?.isHidden = true
    }
    
    func gamesListViewModel(didRecieve error: String) {
        isLoading = false
        tableView.reloadData()
        alertPopup(title: "Ops!", error: error)
    }
}

extension GamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.games.isEmpty {
            return 1
        } else {
            return viewModel.games.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.games.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "noGameCell") else { return UITableViewCell() }

            return cell

        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell else { return UITableViewCell() }
            
            let game = viewModel.games[indexPath.row]
            
            cell.load(game)
            cell.delegate = viewModel
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.games.count > 0 {
            let lastElement = viewModel.games.count - 1
            if !isLoading && indexPath.row == lastElement {
                
                let spinner = UIActivityIndicatorView(style: .medium)
                spinner.color = .systemOrange
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                
                self.tableView.tableFooterView = spinner
                self.tableView.tableFooterView?.isHidden = false
                
                viewModel.fetchMoreGames()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.games.isEmpty {
            tableView.deselectRow(at: indexPath, animated: false)
            isLoading = true
            viewModel.fetchGames()
        } else {
            tableView.deselectRow(at: indexPath, animated: false)

            let gameInfoVC = GameInfoViewController.instantiate(game: viewModel.games[indexPath.row])
            navigationController?.pushViewController(gameInfoVC, animated: true)
        }
    }
}
